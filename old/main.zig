pub fn main(init: std.process.Init) !void {

    ...

    if (res.positionals[0]) |command| {
        switch (command) {
            .add => {
                const State = enum { new, repeat, completed };
                const Answer = enum { y, n };
                const add_parsers = .{
                    .str = clap.parsers.string,
                    .date = clap.parsers.string,
                    .state = clap.parsers.enumeration(State),
                    .answer = clap.parsers.enumeration(Answer),
                };
                var sub_res = clap.parseEx(
                    clap.Help,
                    &add_params,
                    &add_parsers,
                    &iter,
                    .{ .diagnostic = &diag, .allocator = init.gpa },
                ) catch |err| {
                    if (err == error.InvalidArgument) {
                        try addHelp(&writer.interface, program_name);
                        return;
                    }
                    try diag.reportToFile(init.io, .stderr(), err);
                    return err;
                };
                defer sub_res.deinit();

                if (sub_res.args.help != 0) {
                    try addHelp(&writer.interface, program_name);
                    return;
                }

                var scratch_arena = std.heap.ArenaAllocator.init(init.gpa);
                defer scratch_arena.deinit();

                const gpa = scratch_arena.allocator();

                const name = sub_res.args.name orelse try p.promptSQL(
                    gpa,
                    "Name: ",
                    database,
                    "SELECT name FROM media WHERE name LIKE ?",
                );

                const kind = sub_res.args.kind orelse try p.promptSQL(
                    gpa,
                    "Kind: ",
                    database,
                    "SELECT DISTINCT kind FROM media WHERE kind LIKE ?",
                );

                const release =
                    if (sub_res.args.release) |r| (try p.textToISODate(
                        gpa,
                        r,
                    )).? else try p.promptDate(gpa, "Release: ");

                const japanese = blk: {
                    var result: ?bool = null;
                    if (sub_res.args.japanese) |j| {
                        result = j == .y;
                    }
                    break :blk result orelse try p.promptCheck(
                        gpa,
                        "Will I consume it in Japanese? (Y/n): ",
                        .{ .default = true, .default_value = true },
                    );
                };

                const state: State = blk: {
                    var result: ?State = sub_res.args.state;
                    if (result) |r| break :blk r;
                    result = State.new;
                    if (try p.promptCheck(gpa, "Completed? (y/N): ", .{ .default = true }))
                        result = if (try p.promptCheck(
                            gpa,
                            "Want to re-experience? (y/N): ",
                            .{ .default = true },
                        )) .repeat else .completed;
                    break :blk result.?;
                };

                const note: ?[]const u8 = blk: {
                    const result = sub_res.args.note orelse try p.prompt(
                        gpa,
                        "Note: ",
                        true,
                    );
                    break :blk if (result.len == 0) null else result;
                };

                database.execOne(
                    \\INSERT INTO media (name, kind, release, japanese, state, note)
                    \\       VALUES (?, ?, ?, ?, ?, ?)
                , .{ name, kind, release, japanese, state, note });
            },
            .elo => try elo_command.mainElo(
                init,
                &iter,
                program_name,
                &writer.interface,
                database,
            ),
            .league => {
                var sub_res = clap.parseEx(
                    clap.Help,
                    &league_params,
                    clap.parsers.default,
                    &iter,
                    .{ .diagnostic = &diag, .allocator = init.gpa },
                ) catch |err| {
                    if (err == error.InvalidArgument) {
                        try leagueHelp(&writer.interface, program_name);
                        return;
                    }
                    try diag.reportToFile(init.io, .stderr(), err);
                    return err;
                };
                defer sub_res.deinit();

                if (sub_res.args.help != 0 or sub_res.positionals[0] == null or sub_res.positionals[1] == null) {
                    try leagueHelp(&writer.interface, program_name);
                    return;
                }

                const name: []const u8 = sub_res.positionals[0].?;
                const sql: []const u8 = sub_res.positionals[1].?;

                database.execOne("INSERT INTO league (name, sql) VALUES (?, ?)", .{ name, sql });
            },
            .log => {},
            .stats => {},
        }
    }
}

test {
    std.testing.refAllDecls(@This());
}
