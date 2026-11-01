const __root = @This();
pub const __builtin = @import("std").zig.c_translation.builtins;
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __aro_max_align_ll: c_longlong = 0,
    __aro_max_align_ld: c_longdouble = 0,
};
pub const struct___va_list_tag_1 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_1;
pub const va_list = __builtin_va_list;
pub const __gnuc_va_list = __builtin_va_list;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
const union_unnamed_2 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
pub const __mbstate_t = extern struct {
    __count: c_int = 0,
    __value: union_unnamed_2 = @import("std").mem.zeroes(union_unnamed_2),
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t = 0,
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t = 0,
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = opaque {}; // /usr/include//bits/types/struct_FILE.h:75:7: warning: struct demoted to opaque type - has bitfield
pub const struct__IO_FILE = opaque {
    pub const fclose = __root.fclose;
    pub const fflush = __root.fflush;
    pub const fflush_unlocked = __root.fflush_unlocked;
    pub const setbuf = __root.setbuf;
    pub const setvbuf = __root.setvbuf;
    pub const setbuffer = __root.setbuffer;
    pub const setlinebuf = __root.setlinebuf;
    pub const fprintf = __root.fprintf;
    pub const vfprintf = __root.vfprintf;
    pub const fscanf = __root.fscanf;
    pub const vfscanf = __root.vfscanf;
    pub const fgetc = __root.fgetc;
    pub const getc = __root.getc;
    pub const getc_unlocked = __root.getc_unlocked;
    pub const fgetc_unlocked = __root.fgetc_unlocked;
    pub const getw = __root.getw;
    pub const fseek = __root.fseek;
    pub const ftell = __root.ftell;
    pub const rewind = __root.rewind;
    pub const fseeko = __root.fseeko;
    pub const ftello = __root.ftello;
    pub const fgetpos = __root.fgetpos;
    pub const fsetpos = __root.fsetpos;
    pub const clearerr = __root.clearerr;
    pub const feof = __root.feof;
    pub const ferror = __root.ferror;
    pub const clearerr_unlocked = __root.clearerr_unlocked;
    pub const feof_unlocked = __root.feof_unlocked;
    pub const ferror_unlocked = __root.ferror_unlocked;
    pub const fileno = __root.fileno;
    pub const fileno_unlocked = __root.fileno_unlocked;
    pub const pclose = __root.pclose;
    pub const flockfile = __root.flockfile;
    pub const ftrylockfile = __root.ftrylockfile;
    pub const funlockfile = __root.funlockfile;
    pub const __uflow = __root.__uflow;
    pub const __overflow = __root.__overflow;
    pub const rl_getc = __root.rl_getc;
    pub const unlocked = __root.fflush_unlocked;
    pub const uflow = __root.__uflow;
    pub const overflow = __root.__overflow;
};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const struct__IO_codecvt = opaque {};
pub const struct__IO_wide_data = opaque {};
pub const _IO_lock_t = anyopaque;
pub const cookie_read_function_t = fn (__cookie: ?*anyopaque, __buf: [*c]u8, __nbytes: usize) callconv(.c) __ssize_t;
pub const cookie_write_function_t = fn (__cookie: ?*anyopaque, __buf: [*c]const u8, __nbytes: usize) callconv(.c) __ssize_t;
pub const cookie_seek_function_t = fn (__cookie: ?*anyopaque, __pos: [*c]__off64_t, __w: c_int) callconv(.c) c_int;
pub const cookie_close_function_t = fn (__cookie: ?*anyopaque) callconv(.c) c_int;
pub const struct__IO_cookie_io_functions_t = extern struct {
    read: ?*const cookie_read_function_t = null,
    write: ?*const cookie_write_function_t = null,
    seek: ?*const cookie_seek_function_t = null,
    close: ?*const cookie_close_function_t = null,
};
pub const cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const off_t = __off_t;
pub const fpos_t = __fpos_t;
pub extern var stdin: ?*FILE;
pub extern var stdout: ?*FILE;
pub extern var stderr: ?*FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn fclose(__stream: ?*FILE) c_int;
pub extern fn tmpfile() ?*FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fflush(__stream: ?*FILE) c_int;
pub extern fn fflush_unlocked(__stream: ?*FILE) c_int;
pub extern fn fopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) ?*FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: ?*FILE) ?*FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) ?*FILE;
pub extern fn fopencookie(noalias __magic_cookie: ?*anyopaque, noalias __modes: [*c]const u8, __io_funcs: cookie_io_functions_t) ?*FILE;
pub extern fn fmemopen(__s: ?*anyopaque, __len: usize, __modes: [*c]const u8) ?*FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) ?*FILE;
pub extern fn setbuf(noalias __stream: ?*FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: ?*FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: ?*FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: ?*FILE) void;
pub extern fn fprintf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn printf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias __s: ?*FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vprintf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vsprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn snprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vasprintf(noalias __ptr: [*c][*c]u8, noalias __f: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn __asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __s: ?*FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn fgetc(__stream: ?*FILE) c_int;
pub extern fn getc(__stream: ?*FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn getc_unlocked(__stream: ?*FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn fgetc_unlocked(__stream: ?*FILE) c_int;
pub extern fn fputc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putchar(__c: c_int) c_int;
pub extern fn fputc_unlocked(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putc_unlocked(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putchar_unlocked(__c: c_int) c_int;
pub extern fn getw(__stream: ?*FILE) c_int;
pub extern fn putw(__w: c_int, __stream: ?*FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: ?*FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: ?*FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: ?*FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: ?*FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: ?*FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn fread(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fwrite(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __s: ?*FILE) usize;
pub extern fn fread_unlocked(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fseek(__stream: ?*FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: ?*FILE) c_long;
pub extern fn rewind(__stream: ?*FILE) void;
pub extern fn fseeko(__stream: ?*FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: ?*FILE) __off_t;
pub extern fn fgetpos(noalias __stream: ?*FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: ?*FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn clearerr(__stream: ?*FILE) void;
pub extern fn feof(__stream: ?*FILE) c_int;
pub extern fn ferror(__stream: ?*FILE) c_int;
pub extern fn clearerr_unlocked(__stream: ?*FILE) void;
pub extern fn feof_unlocked(__stream: ?*FILE) c_int;
pub extern fn ferror_unlocked(__stream: ?*FILE) c_int;
pub extern fn perror(__s: [*c]const u8) void;
pub extern fn fileno(__stream: ?*FILE) c_int;
pub extern fn fileno_unlocked(__stream: ?*FILE) c_int;
pub extern fn pclose(__stream: ?*FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) ?*FILE;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn flockfile(__stream: ?*FILE) void;
pub extern fn ftrylockfile(__stream: ?*FILE) c_int;
pub extern fn funlockfile(__stream: ?*FILE) void;
pub extern fn __uflow(?*FILE) c_int;
pub extern fn __overflow(?*FILE, c_int) c_int;
pub const sqlite3_version: [*c]const u8 = @extern([*c]const u8, .{
    .name = "sqlite3_version",
});
pub extern fn sqlite3_libversion() [*c]const u8;
pub extern fn sqlite3_sourceid() [*c]const u8;
pub extern fn sqlite3_libversion_number() c_int;
pub extern fn sqlite3_compileoption_used(zOptName: [*c]const u8) c_int;
pub extern fn sqlite3_compileoption_get(N: c_int) [*c]const u8;
pub extern fn sqlite3_threadsafe() c_int;
pub const struct_sqlite3 = opaque {
    pub const sqlite3_close = __root.sqlite3_close;
    pub const sqlite3_close_v2 = __root.sqlite3_close_v2;
    pub const sqlite3_exec = __root.sqlite3_exec;
    pub const sqlite3_db_config = __root.sqlite3_db_config;
    pub const sqlite3_extended_result_codes = __root.sqlite3_extended_result_codes;
    pub const sqlite3_last_insert_rowid = __root.sqlite3_last_insert_rowid;
    pub const sqlite3_set_last_insert_rowid = __root.sqlite3_set_last_insert_rowid;
    pub const sqlite3_changes = __root.sqlite3_changes;
    pub const sqlite3_changes64 = __root.sqlite3_changes64;
    pub const sqlite3_total_changes = __root.sqlite3_total_changes;
    pub const sqlite3_total_changes64 = __root.sqlite3_total_changes64;
    pub const sqlite3_interrupt = __root.sqlite3_interrupt;
    pub const sqlite3_is_interrupted = __root.sqlite3_is_interrupted;
    pub const sqlite3_busy_handler = __root.sqlite3_busy_handler;
    pub const sqlite3_busy_timeout = __root.sqlite3_busy_timeout;
    pub const sqlite3_setlk_timeout = __root.sqlite3_setlk_timeout;
    pub const sqlite3_get_table = __root.sqlite3_get_table;
    pub const sqlite3_set_authorizer = __root.sqlite3_set_authorizer;
    pub const sqlite3_trace = __root.sqlite3_trace;
    pub const sqlite3_profile = __root.sqlite3_profile;
    pub const sqlite3_trace_v2 = __root.sqlite3_trace_v2;
    pub const sqlite3_progress_handler = __root.sqlite3_progress_handler;
    pub const sqlite3_errcode = __root.sqlite3_errcode;
    pub const sqlite3_extended_errcode = __root.sqlite3_extended_errcode;
    pub const sqlite3_errmsg = __root.sqlite3_errmsg;
    pub const sqlite3_errmsg16 = __root.sqlite3_errmsg16;
    pub const sqlite3_error_offset = __root.sqlite3_error_offset;
    pub const sqlite3_set_errmsg = __root.sqlite3_set_errmsg;
    pub const sqlite3_limit = __root.sqlite3_limit;
    pub const sqlite3_prepare = __root.sqlite3_prepare;
    pub const sqlite3_prepare_v2 = __root.sqlite3_prepare_v2;
    pub const sqlite3_prepare_v3 = __root.sqlite3_prepare_v3;
    pub const sqlite3_prepare16 = __root.sqlite3_prepare16;
    pub const sqlite3_prepare16_v2 = __root.sqlite3_prepare16_v2;
    pub const sqlite3_prepare16_v3 = __root.sqlite3_prepare16_v3;
    pub const sqlite3_create_function = __root.sqlite3_create_function;
    pub const sqlite3_create_function16 = __root.sqlite3_create_function16;
    pub const sqlite3_create_function_v2 = __root.sqlite3_create_function_v2;
    pub const sqlite3_create_window_function = __root.sqlite3_create_window_function;
    pub const sqlite3_get_clientdata = __root.sqlite3_get_clientdata;
    pub const sqlite3_set_clientdata = __root.sqlite3_set_clientdata;
    pub const sqlite3_create_collation = __root.sqlite3_create_collation;
    pub const sqlite3_create_collation_v2 = __root.sqlite3_create_collation_v2;
    pub const sqlite3_create_collation16 = __root.sqlite3_create_collation16;
    pub const sqlite3_collation_needed = __root.sqlite3_collation_needed;
    pub const sqlite3_collation_needed16 = __root.sqlite3_collation_needed16;
    pub const sqlite3_get_autocommit = __root.sqlite3_get_autocommit;
    pub const sqlite3_db_name = __root.sqlite3_db_name;
    pub const sqlite3_db_filename = __root.sqlite3_db_filename;
    pub const sqlite3_db_readonly = __root.sqlite3_db_readonly;
    pub const sqlite3_txn_state = __root.sqlite3_txn_state;
    pub const sqlite3_next_stmt = __root.sqlite3_next_stmt;
    pub const sqlite3_commit_hook = __root.sqlite3_commit_hook;
    pub const sqlite3_rollback_hook = __root.sqlite3_rollback_hook;
    pub const sqlite3_autovacuum_pages = __root.sqlite3_autovacuum_pages;
    pub const sqlite3_update_hook = __root.sqlite3_update_hook;
    pub const sqlite3_db_release_memory = __root.sqlite3_db_release_memory;
    pub const sqlite3_table_column_metadata = __root.sqlite3_table_column_metadata;
    pub const sqlite3_load_extension = __root.sqlite3_load_extension;
    pub const sqlite3_enable_load_extension = __root.sqlite3_enable_load_extension;
    pub const sqlite3_create_module = __root.sqlite3_create_module;
    pub const sqlite3_create_module_v2 = __root.sqlite3_create_module_v2;
    pub const sqlite3_drop_modules = __root.sqlite3_drop_modules;
    pub const sqlite3_declare_vtab = __root.sqlite3_declare_vtab;
    pub const sqlite3_overload_function = __root.sqlite3_overload_function;
    pub const sqlite3_blob_open = __root.sqlite3_blob_open;
    pub const sqlite3_db_mutex = __root.sqlite3_db_mutex;
    pub const sqlite3_file_control = __root.sqlite3_file_control;
    pub const sqlite3_str_new = __root.sqlite3_str_new;
    pub const sqlite3_db_status = __root.sqlite3_db_status;
    pub const sqlite3_db_status64 = __root.sqlite3_db_status64;
    pub const sqlite3_backup_init = __root.sqlite3_backup_init;
    pub const sqlite3_unlock_notify = __root.sqlite3_unlock_notify;
    pub const sqlite3_wal_hook = __root.sqlite3_wal_hook;
    pub const sqlite3_wal_autocheckpoint = __root.sqlite3_wal_autocheckpoint;
    pub const sqlite3_wal_checkpoint = __root.sqlite3_wal_checkpoint;
    pub const sqlite3_wal_checkpoint_v2 = __root.sqlite3_wal_checkpoint_v2;
    pub const sqlite3_vtab_config = __root.sqlite3_vtab_config;
    pub const sqlite3_vtab_on_conflict = __root.sqlite3_vtab_on_conflict;
    pub const sqlite3_db_cacheflush = __root.sqlite3_db_cacheflush;
    pub const sqlite3_system_errno = __root.sqlite3_system_errno;
    pub const sqlite3_snapshot_get = __root.sqlite3_snapshot_get;
    pub const sqlite3_snapshot_open = __root.sqlite3_snapshot_open;
    pub const sqlite3_snapshot_recover = __root.sqlite3_snapshot_recover;
    pub const sqlite3_serialize = __root.sqlite3_serialize;
    pub const sqlite3_deserialize = __root.sqlite3_deserialize;
    pub const sqlite3_rtree_geometry_callback = __root.sqlite3_rtree_geometry_callback;
    pub const sqlite3_rtree_query_callback = __root.sqlite3_rtree_query_callback;
    pub const close = __root.sqlite3_close;
    pub const close_v2 = __root.sqlite3_close_v2;
    pub const exec = __root.sqlite3_exec;
    pub const db_config = __root.sqlite3_db_config;
    pub const extended_result_codes = __root.sqlite3_extended_result_codes;
    pub const last_insert_rowid = __root.sqlite3_last_insert_rowid;
    pub const set_last_insert_rowid = __root.sqlite3_set_last_insert_rowid;
    pub const changes = __root.sqlite3_changes;
    pub const changes64 = __root.sqlite3_changes64;
    pub const total_changes = __root.sqlite3_total_changes;
    pub const total_changes64 = __root.sqlite3_total_changes64;
    pub const interrupt = __root.sqlite3_interrupt;
    pub const is_interrupted = __root.sqlite3_is_interrupted;
    pub const busy_handler = __root.sqlite3_busy_handler;
    pub const busy_timeout = __root.sqlite3_busy_timeout;
    pub const setlk_timeout = __root.sqlite3_setlk_timeout;
    pub const get_table = __root.sqlite3_get_table;
    pub const set_authorizer = __root.sqlite3_set_authorizer;
    pub const trace = __root.sqlite3_trace;
    pub const profile = __root.sqlite3_profile;
    pub const trace_v2 = __root.sqlite3_trace_v2;
    pub const progress_handler = __root.sqlite3_progress_handler;
    pub const errcode = __root.sqlite3_errcode;
    pub const extended_errcode = __root.sqlite3_extended_errcode;
    pub const errmsg = __root.sqlite3_errmsg;
    pub const errmsg16 = __root.sqlite3_errmsg16;
    pub const error_offset = __root.sqlite3_error_offset;
    pub const set_errmsg = __root.sqlite3_set_errmsg;
    pub const limit = __root.sqlite3_limit;
    pub const prepare = __root.sqlite3_prepare;
    pub const prepare_v2 = __root.sqlite3_prepare_v2;
    pub const prepare_v3 = __root.sqlite3_prepare_v3;
    pub const prepare16 = __root.sqlite3_prepare16;
    pub const prepare16_v2 = __root.sqlite3_prepare16_v2;
    pub const prepare16_v3 = __root.sqlite3_prepare16_v3;
    pub const create_function = __root.sqlite3_create_function;
    pub const create_function16 = __root.sqlite3_create_function16;
    pub const create_function_v2 = __root.sqlite3_create_function_v2;
    pub const create_window_function = __root.sqlite3_create_window_function;
    pub const get_clientdata = __root.sqlite3_get_clientdata;
    pub const set_clientdata = __root.sqlite3_set_clientdata;
    pub const create_collation = __root.sqlite3_create_collation;
    pub const create_collation_v2 = __root.sqlite3_create_collation_v2;
    pub const create_collation16 = __root.sqlite3_create_collation16;
    pub const collation_needed = __root.sqlite3_collation_needed;
    pub const collation_needed16 = __root.sqlite3_collation_needed16;
    pub const get_autocommit = __root.sqlite3_get_autocommit;
    pub const db_name = __root.sqlite3_db_name;
    pub const db_filename = __root.sqlite3_db_filename;
    pub const db_readonly = __root.sqlite3_db_readonly;
    pub const txn_state = __root.sqlite3_txn_state;
    pub const next_stmt = __root.sqlite3_next_stmt;
    pub const commit_hook = __root.sqlite3_commit_hook;
    pub const rollback_hook = __root.sqlite3_rollback_hook;
    pub const autovacuum_pages = __root.sqlite3_autovacuum_pages;
    pub const update_hook = __root.sqlite3_update_hook;
    pub const db_release_memory = __root.sqlite3_db_release_memory;
    pub const table_column_metadata = __root.sqlite3_table_column_metadata;
    pub const load_extension = __root.sqlite3_load_extension;
    pub const enable_load_extension = __root.sqlite3_enable_load_extension;
    pub const create_module = __root.sqlite3_create_module;
    pub const create_module_v2 = __root.sqlite3_create_module_v2;
    pub const drop_modules = __root.sqlite3_drop_modules;
    pub const declare_vtab = __root.sqlite3_declare_vtab;
    pub const overload_function = __root.sqlite3_overload_function;
    pub const blob_open = __root.sqlite3_blob_open;
    pub const db_mutex = __root.sqlite3_db_mutex;
    pub const file_control = __root.sqlite3_file_control;
    pub const str_new = __root.sqlite3_str_new;
    pub const db_status = __root.sqlite3_db_status;
    pub const db_status64 = __root.sqlite3_db_status64;
    pub const backup_init = __root.sqlite3_backup_init;
    pub const unlock_notify = __root.sqlite3_unlock_notify;
    pub const wal_hook = __root.sqlite3_wal_hook;
    pub const wal_autocheckpoint = __root.sqlite3_wal_autocheckpoint;
    pub const wal_checkpoint = __root.sqlite3_wal_checkpoint;
    pub const wal_checkpoint_v2 = __root.sqlite3_wal_checkpoint_v2;
    pub const vtab_config = __root.sqlite3_vtab_config;
    pub const vtab_on_conflict = __root.sqlite3_vtab_on_conflict;
    pub const db_cacheflush = __root.sqlite3_db_cacheflush;
    pub const system_errno = __root.sqlite3_system_errno;
    pub const snapshot_get = __root.sqlite3_snapshot_get;
    pub const snapshot_open = __root.sqlite3_snapshot_open;
    pub const snapshot_recover = __root.sqlite3_snapshot_recover;
    pub const serialize = __root.sqlite3_serialize;
    pub const deserialize = __root.sqlite3_deserialize;
    pub const rtree_geometry_callback = __root.sqlite3_rtree_geometry_callback;
    pub const rtree_query_callback = __root.sqlite3_rtree_query_callback;
};
pub const sqlite3 = struct_sqlite3;
pub const sqlite_int64 = c_longlong;
pub const sqlite_uint64 = c_ulonglong;
pub const sqlite3_int64 = sqlite_int64;
pub const sqlite3_uint64 = sqlite_uint64;
pub extern fn sqlite3_close(?*sqlite3) c_int;
pub extern fn sqlite3_close_v2(?*sqlite3) c_int;
pub const sqlite3_callback = ?*const fn (?*anyopaque, c_int, [*c][*c]u8, [*c][*c]u8) callconv(.c) c_int;
pub extern fn sqlite3_exec(?*sqlite3, sql: [*c]const u8, callback: ?*const fn (?*anyopaque, c_int, [*c][*c]u8, [*c][*c]u8) callconv(.c) c_int, ?*anyopaque, errmsg: [*c][*c]u8) c_int;
pub const sqlite3_file = struct_sqlite3_file;
pub const struct_sqlite3_io_methods = extern struct {
    iVersion: c_int = 0,
    xClose: ?*const fn ([*c]sqlite3_file) callconv(.c) c_int = null,
    xRead: ?*const fn ([*c]sqlite3_file, ?*anyopaque, iAmt: c_int, iOfst: sqlite3_int64) callconv(.c) c_int = null,
    xWrite: ?*const fn ([*c]sqlite3_file, ?*const anyopaque, iAmt: c_int, iOfst: sqlite3_int64) callconv(.c) c_int = null,
    xTruncate: ?*const fn ([*c]sqlite3_file, size: sqlite3_int64) callconv(.c) c_int = null,
    xSync: ?*const fn ([*c]sqlite3_file, flags: c_int) callconv(.c) c_int = null,
    xFileSize: ?*const fn ([*c]sqlite3_file, pSize: [*c]sqlite3_int64) callconv(.c) c_int = null,
    xLock: ?*const fn ([*c]sqlite3_file, c_int) callconv(.c) c_int = null,
    xUnlock: ?*const fn ([*c]sqlite3_file, c_int) callconv(.c) c_int = null,
    xCheckReservedLock: ?*const fn ([*c]sqlite3_file, pResOut: [*c]c_int) callconv(.c) c_int = null,
    xFileControl: ?*const fn ([*c]sqlite3_file, op: c_int, pArg: ?*anyopaque) callconv(.c) c_int = null,
    xSectorSize: ?*const fn ([*c]sqlite3_file) callconv(.c) c_int = null,
    xDeviceCharacteristics: ?*const fn ([*c]sqlite3_file) callconv(.c) c_int = null,
    xShmMap: ?*const fn ([*c]sqlite3_file, iPg: c_int, pgsz: c_int, c_int, [*c]?*volatile anyopaque) callconv(.c) c_int = null,
    xShmLock: ?*const fn ([*c]sqlite3_file, offset: c_int, n: c_int, flags: c_int) callconv(.c) c_int = null,
    xShmBarrier: ?*const fn ([*c]sqlite3_file) callconv(.c) void = null,
    xShmUnmap: ?*const fn ([*c]sqlite3_file, deleteFlag: c_int) callconv(.c) c_int = null,
    xFetch: ?*const fn ([*c]sqlite3_file, iOfst: sqlite3_int64, iAmt: c_int, pp: [*c]?*anyopaque) callconv(.c) c_int = null,
    xUnfetch: ?*const fn ([*c]sqlite3_file, iOfst: sqlite3_int64, p: ?*anyopaque) callconv(.c) c_int = null,
};
pub const struct_sqlite3_file = extern struct {
    pMethods: [*c]const struct_sqlite3_io_methods = null,
};
pub const sqlite3_io_methods = struct_sqlite3_io_methods;
pub const struct_sqlite3_mutex = opaque {
    pub const sqlite3_mutex_free = __root.sqlite3_mutex_free;
    pub const sqlite3_mutex_enter = __root.sqlite3_mutex_enter;
    pub const sqlite3_mutex_try = __root.sqlite3_mutex_try;
    pub const sqlite3_mutex_leave = __root.sqlite3_mutex_leave;
    pub const sqlite3_mutex_held = __root.sqlite3_mutex_held;
    pub const sqlite3_mutex_notheld = __root.sqlite3_mutex_notheld;
    pub const free = __root.sqlite3_mutex_free;
    pub const enter = __root.sqlite3_mutex_enter;
    pub const @"try" = __root.sqlite3_mutex_try;
    pub const leave = __root.sqlite3_mutex_leave;
    pub const held = __root.sqlite3_mutex_held;
    pub const notheld = __root.sqlite3_mutex_notheld;
};
pub const sqlite3_mutex = struct_sqlite3_mutex;
pub const struct_sqlite3_api_routines = opaque {};
pub const sqlite3_api_routines = struct_sqlite3_api_routines;
pub const sqlite3_filename = [*c]const u8;
pub const sqlite3_vfs = struct_sqlite3_vfs;
pub const sqlite3_syscall_ptr = ?*const fn () callconv(.c) void;
pub const struct_sqlite3_vfs = extern struct {
    iVersion: c_int = 0,
    szOsFile: c_int = 0,
    mxPathname: c_int = 0,
    pNext: [*c]sqlite3_vfs = null,
    zName: [*c]const u8 = null,
    pAppData: ?*anyopaque = null,
    xOpen: ?*const fn ([*c]sqlite3_vfs, zName: sqlite3_filename, [*c]sqlite3_file, flags: c_int, pOutFlags: [*c]c_int) callconv(.c) c_int = null,
    xDelete: ?*const fn ([*c]sqlite3_vfs, zName: [*c]const u8, syncDir: c_int) callconv(.c) c_int = null,
    xAccess: ?*const fn ([*c]sqlite3_vfs, zName: [*c]const u8, flags: c_int, pResOut: [*c]c_int) callconv(.c) c_int = null,
    xFullPathname: ?*const fn ([*c]sqlite3_vfs, zName: [*c]const u8, nOut: c_int, zOut: [*c]u8) callconv(.c) c_int = null,
    xDlOpen: ?*const fn ([*c]sqlite3_vfs, zFilename: [*c]const u8) callconv(.c) ?*anyopaque = null,
    xDlError: ?*const fn ([*c]sqlite3_vfs, nByte: c_int, zErrMsg: [*c]u8) callconv(.c) void = null,
    xDlSym: ?*const fn ([*c]sqlite3_vfs, ?*anyopaque, zSymbol: [*c]const u8) callconv(.c) ?*const fn () callconv(.c) void = null,
    xDlClose: ?*const fn ([*c]sqlite3_vfs, ?*anyopaque) callconv(.c) void = null,
    xRandomness: ?*const fn ([*c]sqlite3_vfs, nByte: c_int, zOut: [*c]u8) callconv(.c) c_int = null,
    xSleep: ?*const fn ([*c]sqlite3_vfs, microseconds: c_int) callconv(.c) c_int = null,
    xCurrentTime: ?*const fn ([*c]sqlite3_vfs, [*c]f64) callconv(.c) c_int = null,
    xGetLastError: ?*const fn ([*c]sqlite3_vfs, c_int, [*c]u8) callconv(.c) c_int = null,
    xCurrentTimeInt64: ?*const fn ([*c]sqlite3_vfs, [*c]sqlite3_int64) callconv(.c) c_int = null,
    xSetSystemCall: ?*const fn ([*c]sqlite3_vfs, zName: [*c]const u8, sqlite3_syscall_ptr) callconv(.c) c_int = null,
    xGetSystemCall: ?*const fn ([*c]sqlite3_vfs, zName: [*c]const u8) callconv(.c) sqlite3_syscall_ptr = null,
    xNextSystemCall: ?*const fn ([*c]sqlite3_vfs, zName: [*c]const u8) callconv(.c) [*c]const u8 = null,
    pub const sqlite3_vfs_register = __root.sqlite3_vfs_register;
    pub const sqlite3_vfs_unregister = __root.sqlite3_vfs_unregister;
    pub const register = __root.sqlite3_vfs_register;
    pub const unregister = __root.sqlite3_vfs_unregister;
};
pub extern fn sqlite3_initialize() c_int;
pub extern fn sqlite3_shutdown() c_int;
pub extern fn sqlite3_os_init() c_int;
pub extern fn sqlite3_os_end() c_int;
pub extern fn sqlite3_config(c_int, ...) c_int;
pub extern fn sqlite3_db_config(?*sqlite3, op: c_int, ...) c_int;
pub const struct_sqlite3_mem_methods = extern struct {
    xMalloc: ?*const fn (c_int) callconv(.c) ?*anyopaque = null,
    xFree: ?*const fn (?*anyopaque) callconv(.c) void = null,
    xRealloc: ?*const fn (?*anyopaque, c_int) callconv(.c) ?*anyopaque = null,
    xSize: ?*const fn (?*anyopaque) callconv(.c) c_int = null,
    xRoundup: ?*const fn (c_int) callconv(.c) c_int = null,
    xInit: ?*const fn (?*anyopaque) callconv(.c) c_int = null,
    xShutdown: ?*const fn (?*anyopaque) callconv(.c) void = null,
    pAppData: ?*anyopaque = null,
};
pub const sqlite3_mem_methods = struct_sqlite3_mem_methods;
pub extern fn sqlite3_extended_result_codes(?*sqlite3, onoff: c_int) c_int;
pub extern fn sqlite3_last_insert_rowid(?*sqlite3) sqlite3_int64;
pub extern fn sqlite3_set_last_insert_rowid(?*sqlite3, sqlite3_int64) void;
pub extern fn sqlite3_changes(?*sqlite3) c_int;
pub extern fn sqlite3_changes64(?*sqlite3) sqlite3_int64;
pub extern fn sqlite3_total_changes(?*sqlite3) c_int;
pub extern fn sqlite3_total_changes64(?*sqlite3) sqlite3_int64;
pub extern fn sqlite3_interrupt(?*sqlite3) void;
pub extern fn sqlite3_is_interrupted(?*sqlite3) c_int;
pub extern fn sqlite3_complete(sql: [*c]const u8) c_int;
pub extern fn sqlite3_complete16(sql: ?*const anyopaque) c_int;
pub extern fn sqlite3_busy_handler(?*sqlite3, ?*const fn (?*anyopaque, c_int) callconv(.c) c_int, ?*anyopaque) c_int;
pub extern fn sqlite3_busy_timeout(?*sqlite3, ms: c_int) c_int;
pub extern fn sqlite3_setlk_timeout(?*sqlite3, ms: c_int, flags: c_int) c_int;
pub extern fn sqlite3_get_table(db: ?*sqlite3, zSql: [*c]const u8, pazResult: [*c][*c][*c]u8, pnRow: [*c]c_int, pnColumn: [*c]c_int, pzErrmsg: [*c][*c]u8) c_int;
pub extern fn sqlite3_free_table(result: [*c][*c]u8) void;
pub extern fn sqlite3_mprintf([*c]const u8, ...) [*c]u8;
pub extern fn sqlite3_vmprintf([*c]const u8, [*c]struct___va_list_tag_1) [*c]u8;
pub extern fn sqlite3_snprintf(c_int, [*c]u8, [*c]const u8, ...) [*c]u8;
pub extern fn sqlite3_vsnprintf(c_int, [*c]u8, [*c]const u8, [*c]struct___va_list_tag_1) [*c]u8;
pub extern fn sqlite3_malloc(c_int) ?*anyopaque;
pub extern fn sqlite3_malloc64(sqlite3_uint64) ?*anyopaque;
pub extern fn sqlite3_realloc(?*anyopaque, c_int) ?*anyopaque;
pub extern fn sqlite3_realloc64(?*anyopaque, sqlite3_uint64) ?*anyopaque;
pub extern fn sqlite3_free(?*anyopaque) void;
pub extern fn sqlite3_msize(?*anyopaque) sqlite3_uint64;
pub extern fn sqlite3_memory_used() sqlite3_int64;
pub extern fn sqlite3_memory_highwater(resetFlag: c_int) sqlite3_int64;
pub extern fn sqlite3_randomness(N: c_int, P: ?*anyopaque) void;
pub extern fn sqlite3_set_authorizer(?*sqlite3, xAuth: ?*const fn (?*anyopaque, c_int, [*c]const u8, [*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) c_int, pUserData: ?*anyopaque) c_int;
pub extern fn sqlite3_trace(?*sqlite3, xTrace: ?*const fn (?*anyopaque, [*c]const u8) callconv(.c) void, ?*anyopaque) ?*anyopaque;
pub extern fn sqlite3_profile(?*sqlite3, xProfile: ?*const fn (?*anyopaque, [*c]const u8, sqlite3_uint64) callconv(.c) void, ?*anyopaque) ?*anyopaque;
pub extern fn sqlite3_trace_v2(?*sqlite3, uMask: c_uint, xCallback: ?*const fn (c_uint, ?*anyopaque, ?*anyopaque, ?*anyopaque) callconv(.c) c_int, pCtx: ?*anyopaque) c_int;
pub extern fn sqlite3_progress_handler(?*sqlite3, c_int, ?*const fn (?*anyopaque) callconv(.c) c_int, ?*anyopaque) void;
pub extern fn sqlite3_open(filename: [*c]const u8, ppDb: [*c]?*sqlite3) c_int;
pub extern fn sqlite3_open16(filename: ?*const anyopaque, ppDb: [*c]?*sqlite3) c_int;
pub extern fn sqlite3_open_v2(filename: [*c]const u8, ppDb: [*c]?*sqlite3, flags: c_int, zVfs: [*c]const u8) c_int;
pub extern fn sqlite3_uri_parameter(z: sqlite3_filename, zParam: [*c]const u8) [*c]const u8;
pub extern fn sqlite3_uri_boolean(z: sqlite3_filename, zParam: [*c]const u8, bDefault: c_int) c_int;
pub extern fn sqlite3_uri_int64(sqlite3_filename, [*c]const u8, sqlite3_int64) sqlite3_int64;
pub extern fn sqlite3_uri_key(z: sqlite3_filename, N: c_int) [*c]const u8;
pub extern fn sqlite3_filename_database(sqlite3_filename) [*c]const u8;
pub extern fn sqlite3_filename_journal(sqlite3_filename) [*c]const u8;
pub extern fn sqlite3_filename_wal(sqlite3_filename) [*c]const u8;
pub extern fn sqlite3_database_file_object([*c]const u8) [*c]sqlite3_file;
pub extern fn sqlite3_create_filename(zDatabase: [*c]const u8, zJournal: [*c]const u8, zWal: [*c]const u8, nParam: c_int, azParam: [*c][*c]const u8) sqlite3_filename;
pub extern fn sqlite3_free_filename(sqlite3_filename) void;
pub extern fn sqlite3_errcode(db: ?*sqlite3) c_int;
pub extern fn sqlite3_extended_errcode(db: ?*sqlite3) c_int;
pub extern fn sqlite3_errmsg(?*sqlite3) [*c]const u8;
pub extern fn sqlite3_errmsg16(?*sqlite3) ?*const anyopaque;
pub extern fn sqlite3_errstr(c_int) [*c]const u8;
pub extern fn sqlite3_error_offset(db: ?*sqlite3) c_int;
pub extern fn sqlite3_set_errmsg(db: ?*sqlite3, errcode: c_int, zErrMsg: [*c]const u8) c_int;
pub const struct_sqlite3_stmt = opaque {
    pub const sqlite3_sql = __root.sqlite3_sql;
    pub const sqlite3_expanded_sql = __root.sqlite3_expanded_sql;
    pub const sqlite3_stmt_readonly = __root.sqlite3_stmt_readonly;
    pub const sqlite3_stmt_isexplain = __root.sqlite3_stmt_isexplain;
    pub const sqlite3_stmt_explain = __root.sqlite3_stmt_explain;
    pub const sqlite3_stmt_busy = __root.sqlite3_stmt_busy;
    pub const sqlite3_bind_blob = __root.sqlite3_bind_blob;
    pub const sqlite3_bind_blob64 = __root.sqlite3_bind_blob64;
    pub const sqlite3_bind_double = __root.sqlite3_bind_double;
    pub const sqlite3_bind_int = __root.sqlite3_bind_int;
    pub const sqlite3_bind_int64 = __root.sqlite3_bind_int64;
    pub const sqlite3_bind_null = __root.sqlite3_bind_null;
    pub const sqlite3_bind_text = __root.sqlite3_bind_text;
    pub const sqlite3_bind_text16 = __root.sqlite3_bind_text16;
    pub const sqlite3_bind_text64 = __root.sqlite3_bind_text64;
    pub const sqlite3_bind_value = __root.sqlite3_bind_value;
    pub const sqlite3_bind_pointer = __root.sqlite3_bind_pointer;
    pub const sqlite3_bind_zeroblob = __root.sqlite3_bind_zeroblob;
    pub const sqlite3_bind_zeroblob64 = __root.sqlite3_bind_zeroblob64;
    pub const sqlite3_bind_parameter_count = __root.sqlite3_bind_parameter_count;
    pub const sqlite3_bind_parameter_name = __root.sqlite3_bind_parameter_name;
    pub const sqlite3_bind_parameter_index = __root.sqlite3_bind_parameter_index;
    pub const sqlite3_clear_bindings = __root.sqlite3_clear_bindings;
    pub const sqlite3_column_count = __root.sqlite3_column_count;
    pub const sqlite3_column_name = __root.sqlite3_column_name;
    pub const sqlite3_column_name16 = __root.sqlite3_column_name16;
    pub const sqlite3_column_database_name = __root.sqlite3_column_database_name;
    pub const sqlite3_column_database_name16 = __root.sqlite3_column_database_name16;
    pub const sqlite3_column_table_name = __root.sqlite3_column_table_name;
    pub const sqlite3_column_table_name16 = __root.sqlite3_column_table_name16;
    pub const sqlite3_column_origin_name = __root.sqlite3_column_origin_name;
    pub const sqlite3_column_origin_name16 = __root.sqlite3_column_origin_name16;
    pub const sqlite3_column_decltype = __root.sqlite3_column_decltype;
    pub const sqlite3_column_decltype16 = __root.sqlite3_column_decltype16;
    pub const sqlite3_step = __root.sqlite3_step;
    pub const sqlite3_data_count = __root.sqlite3_data_count;
    pub const sqlite3_column_blob = __root.sqlite3_column_blob;
    pub const sqlite3_column_double = __root.sqlite3_column_double;
    pub const sqlite3_column_int = __root.sqlite3_column_int;
    pub const sqlite3_column_int64 = __root.sqlite3_column_int64;
    pub const sqlite3_column_text = __root.sqlite3_column_text;
    pub const sqlite3_column_text16 = __root.sqlite3_column_text16;
    pub const sqlite3_column_value = __root.sqlite3_column_value;
    pub const sqlite3_column_bytes = __root.sqlite3_column_bytes;
    pub const sqlite3_column_bytes16 = __root.sqlite3_column_bytes16;
    pub const sqlite3_column_type = __root.sqlite3_column_type;
    pub const sqlite3_finalize = __root.sqlite3_finalize;
    pub const sqlite3_reset = __root.sqlite3_reset;
    pub const sqlite3_expired = __root.sqlite3_expired;
    pub const sqlite3_transfer_bindings = __root.sqlite3_transfer_bindings;
    pub const sqlite3_db_handle = __root.sqlite3_db_handle;
    pub const sqlite3_stmt_status = __root.sqlite3_stmt_status;
    pub const sqlite3_stmt_scanstatus = __root.sqlite3_stmt_scanstatus;
    pub const sqlite3_stmt_scanstatus_v2 = __root.sqlite3_stmt_scanstatus_v2;
    pub const sqlite3_stmt_scanstatus_reset = __root.sqlite3_stmt_scanstatus_reset;
    pub const sqlite3_carray_bind = __root.sqlite3_carray_bind;
    pub const sql = __root.sqlite3_sql;
    pub const readonly = __root.sqlite3_stmt_readonly;
    pub const isexplain = __root.sqlite3_stmt_isexplain;
    pub const explain = __root.sqlite3_stmt_explain;
    pub const busy = __root.sqlite3_stmt_busy;
    pub const blob = __root.sqlite3_bind_blob;
    pub const blob64 = __root.sqlite3_bind_blob64;
    pub const double = __root.sqlite3_bind_double;
    pub const int = __root.sqlite3_bind_int;
    pub const int64 = __root.sqlite3_bind_int64;
    pub const @"null" = __root.sqlite3_bind_null;
    pub const text = __root.sqlite3_bind_text;
    pub const text16 = __root.sqlite3_bind_text16;
    pub const text64 = __root.sqlite3_bind_text64;
    pub const value = __root.sqlite3_bind_value;
    pub const pointer = __root.sqlite3_bind_pointer;
    pub const zeroblob = __root.sqlite3_bind_zeroblob;
    pub const zeroblob64 = __root.sqlite3_bind_zeroblob64;
    pub const count = __root.sqlite3_bind_parameter_count;
    pub const name = __root.sqlite3_bind_parameter_name;
    pub const bindings = __root.sqlite3_clear_bindings;
    pub const name16 = __root.sqlite3_column_name16;
    pub const decltype = __root.sqlite3_column_decltype;
    pub const decltype16 = __root.sqlite3_column_decltype16;
    pub const step = __root.sqlite3_step;
    pub const bytes = __root.sqlite3_column_bytes;
    pub const bytes16 = __root.sqlite3_column_bytes16;
    pub const @"type" = __root.sqlite3_column_type;
    pub const finalize = __root.sqlite3_finalize;
    pub const reset = __root.sqlite3_reset;
    pub const expired = __root.sqlite3_expired;
    pub const handle = __root.sqlite3_db_handle;
    pub const status = __root.sqlite3_stmt_status;
    pub const scanstatus = __root.sqlite3_stmt_scanstatus;
    pub const scanstatus_v2 = __root.sqlite3_stmt_scanstatus_v2;
    pub const scanstatus_reset = __root.sqlite3_stmt_scanstatus_reset;
    pub const bind = __root.sqlite3_carray_bind;
};
pub const sqlite3_stmt = struct_sqlite3_stmt;
pub extern fn sqlite3_limit(?*sqlite3, id: c_int, newVal: c_int) c_int;
pub extern fn sqlite3_prepare(db: ?*sqlite3, zSql: [*c]const u8, nByte: c_int, ppStmt: [*c]?*sqlite3_stmt, pzTail: [*c][*c]const u8) c_int;
pub extern fn sqlite3_prepare_v2(db: ?*sqlite3, zSql: [*c]const u8, nByte: c_int, ppStmt: [*c]?*sqlite3_stmt, pzTail: [*c][*c]const u8) c_int;
pub extern fn sqlite3_prepare_v3(db: ?*sqlite3, zSql: [*c]const u8, nByte: c_int, prepFlags: c_uint, ppStmt: [*c]?*sqlite3_stmt, pzTail: [*c][*c]const u8) c_int;
pub extern fn sqlite3_prepare16(db: ?*sqlite3, zSql: ?*const anyopaque, nByte: c_int, ppStmt: [*c]?*sqlite3_stmt, pzTail: [*c]?*const anyopaque) c_int;
pub extern fn sqlite3_prepare16_v2(db: ?*sqlite3, zSql: ?*const anyopaque, nByte: c_int, ppStmt: [*c]?*sqlite3_stmt, pzTail: [*c]?*const anyopaque) c_int;
pub extern fn sqlite3_prepare16_v3(db: ?*sqlite3, zSql: ?*const anyopaque, nByte: c_int, prepFlags: c_uint, ppStmt: [*c]?*sqlite3_stmt, pzTail: [*c]?*const anyopaque) c_int;
pub extern fn sqlite3_sql(pStmt: ?*sqlite3_stmt) [*c]const u8;
pub extern fn sqlite3_expanded_sql(pStmt: ?*sqlite3_stmt) [*c]u8;
pub extern fn sqlite3_stmt_readonly(pStmt: ?*sqlite3_stmt) c_int;
pub extern fn sqlite3_stmt_isexplain(pStmt: ?*sqlite3_stmt) c_int;
pub extern fn sqlite3_stmt_explain(pStmt: ?*sqlite3_stmt, eMode: c_int) c_int;
pub extern fn sqlite3_stmt_busy(?*sqlite3_stmt) c_int;
pub const struct_sqlite3_value = opaque {
    pub const sqlite3_value_blob = __root.sqlite3_value_blob;
    pub const sqlite3_value_double = __root.sqlite3_value_double;
    pub const sqlite3_value_int = __root.sqlite3_value_int;
    pub const sqlite3_value_int64 = __root.sqlite3_value_int64;
    pub const sqlite3_value_pointer = __root.sqlite3_value_pointer;
    pub const sqlite3_value_text = __root.sqlite3_value_text;
    pub const sqlite3_value_text16 = __root.sqlite3_value_text16;
    pub const sqlite3_value_text16le = __root.sqlite3_value_text16le;
    pub const sqlite3_value_text16be = __root.sqlite3_value_text16be;
    pub const sqlite3_value_bytes = __root.sqlite3_value_bytes;
    pub const sqlite3_value_bytes16 = __root.sqlite3_value_bytes16;
    pub const sqlite3_value_type = __root.sqlite3_value_type;
    pub const sqlite3_value_numeric_type = __root.sqlite3_value_numeric_type;
    pub const sqlite3_value_nochange = __root.sqlite3_value_nochange;
    pub const sqlite3_value_frombind = __root.sqlite3_value_frombind;
    pub const sqlite3_value_encoding = __root.sqlite3_value_encoding;
    pub const sqlite3_value_subtype = __root.sqlite3_value_subtype;
    pub const sqlite3_value_dup = __root.sqlite3_value_dup;
    pub const sqlite3_value_free = __root.sqlite3_value_free;
    pub const sqlite3_vtab_in_first = __root.sqlite3_vtab_in_first;
    pub const sqlite3_vtab_in_next = __root.sqlite3_vtab_in_next;
    pub const blob = __root.sqlite3_value_blob;
    pub const double = __root.sqlite3_value_double;
    pub const int = __root.sqlite3_value_int;
    pub const int64 = __root.sqlite3_value_int64;
    pub const pointer = __root.sqlite3_value_pointer;
    pub const text = __root.sqlite3_value_text;
    pub const text16 = __root.sqlite3_value_text16;
    pub const text16le = __root.sqlite3_value_text16le;
    pub const text16be = __root.sqlite3_value_text16be;
    pub const bytes = __root.sqlite3_value_bytes;
    pub const bytes16 = __root.sqlite3_value_bytes16;
    pub const @"type" = __root.sqlite3_value_type;
    pub const numeric_type = __root.sqlite3_value_numeric_type;
    pub const nochange = __root.sqlite3_value_nochange;
    pub const frombind = __root.sqlite3_value_frombind;
    pub const encoding = __root.sqlite3_value_encoding;
    pub const subtype = __root.sqlite3_value_subtype;
    pub const dup = __root.sqlite3_value_dup;
    pub const free = __root.sqlite3_value_free;
    pub const first = __root.sqlite3_vtab_in_first;
    pub const next = __root.sqlite3_vtab_in_next;
};
pub const sqlite3_value = struct_sqlite3_value;
pub const struct_sqlite3_context = opaque {
    pub const sqlite3_aggregate_count = __root.sqlite3_aggregate_count;
    pub const sqlite3_aggregate_context = __root.sqlite3_aggregate_context;
    pub const sqlite3_user_data = __root.sqlite3_user_data;
    pub const sqlite3_context_db_handle = __root.sqlite3_context_db_handle;
    pub const sqlite3_get_auxdata = __root.sqlite3_get_auxdata;
    pub const sqlite3_set_auxdata = __root.sqlite3_set_auxdata;
    pub const sqlite3_result_blob = __root.sqlite3_result_blob;
    pub const sqlite3_result_blob64 = __root.sqlite3_result_blob64;
    pub const sqlite3_result_double = __root.sqlite3_result_double;
    pub const sqlite3_result_error = __root.sqlite3_result_error;
    pub const sqlite3_result_error16 = __root.sqlite3_result_error16;
    pub const sqlite3_result_error_toobig = __root.sqlite3_result_error_toobig;
    pub const sqlite3_result_error_nomem = __root.sqlite3_result_error_nomem;
    pub const sqlite3_result_error_code = __root.sqlite3_result_error_code;
    pub const sqlite3_result_int = __root.sqlite3_result_int;
    pub const sqlite3_result_int64 = __root.sqlite3_result_int64;
    pub const sqlite3_result_null = __root.sqlite3_result_null;
    pub const sqlite3_result_text = __root.sqlite3_result_text;
    pub const sqlite3_result_text64 = __root.sqlite3_result_text64;
    pub const sqlite3_result_text16 = __root.sqlite3_result_text16;
    pub const sqlite3_result_text16le = __root.sqlite3_result_text16le;
    pub const sqlite3_result_text16be = __root.sqlite3_result_text16be;
    pub const sqlite3_result_value = __root.sqlite3_result_value;
    pub const sqlite3_result_pointer = __root.sqlite3_result_pointer;
    pub const sqlite3_result_zeroblob = __root.sqlite3_result_zeroblob;
    pub const sqlite3_result_zeroblob64 = __root.sqlite3_result_zeroblob64;
    pub const sqlite3_result_subtype = __root.sqlite3_result_subtype;
    pub const sqlite3_vtab_nochange = __root.sqlite3_vtab_nochange;
    pub const count = __root.sqlite3_aggregate_count;
    pub const context = __root.sqlite3_aggregate_context;
    pub const data = __root.sqlite3_user_data;
    pub const db_handle = __root.sqlite3_context_db_handle;
    pub const auxdata = __root.sqlite3_get_auxdata;
    pub const blob = __root.sqlite3_result_blob;
    pub const blob64 = __root.sqlite3_result_blob64;
    pub const double = __root.sqlite3_result_double;
    pub const @"error" = __root.sqlite3_result_error;
    pub const error16 = __root.sqlite3_result_error16;
    pub const toobig = __root.sqlite3_result_error_toobig;
    pub const nomem = __root.sqlite3_result_error_nomem;
    pub const code = __root.sqlite3_result_error_code;
    pub const int = __root.sqlite3_result_int;
    pub const int64 = __root.sqlite3_result_int64;
    pub const @"null" = __root.sqlite3_result_null;
    pub const text = __root.sqlite3_result_text;
    pub const text64 = __root.sqlite3_result_text64;
    pub const text16 = __root.sqlite3_result_text16;
    pub const text16le = __root.sqlite3_result_text16le;
    pub const text16be = __root.sqlite3_result_text16be;
    pub const value = __root.sqlite3_result_value;
    pub const pointer = __root.sqlite3_result_pointer;
    pub const zeroblob = __root.sqlite3_result_zeroblob;
    pub const zeroblob64 = __root.sqlite3_result_zeroblob64;
    pub const subtype = __root.sqlite3_result_subtype;
    pub const nochange = __root.sqlite3_vtab_nochange;
};
pub const sqlite3_context = struct_sqlite3_context;
pub extern fn sqlite3_bind_blob(?*sqlite3_stmt, c_int, ?*const anyopaque, n: c_int, ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_bind_blob64(?*sqlite3_stmt, c_int, ?*const anyopaque, sqlite3_uint64, ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_bind_double(?*sqlite3_stmt, c_int, f64) c_int;
pub extern fn sqlite3_bind_int(?*sqlite3_stmt, c_int, c_int) c_int;
pub extern fn sqlite3_bind_int64(?*sqlite3_stmt, c_int, sqlite3_int64) c_int;
pub extern fn sqlite3_bind_null(?*sqlite3_stmt, c_int) c_int;
pub extern fn sqlite3_bind_text(?*sqlite3_stmt, c_int, [*c]const u8, c_int, ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_bind_text16(?*sqlite3_stmt, c_int, ?*const anyopaque, c_int, ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_bind_text64(?*sqlite3_stmt, c_int, [*c]const u8, sqlite3_uint64, ?*const fn (?*anyopaque) callconv(.c) void, encoding: u8) c_int;
pub extern fn sqlite3_bind_value(?*sqlite3_stmt, c_int, ?*const sqlite3_value) c_int;
pub extern fn sqlite3_bind_pointer(?*sqlite3_stmt, c_int, ?*anyopaque, [*c]const u8, ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_bind_zeroblob(?*sqlite3_stmt, c_int, n: c_int) c_int;
pub extern fn sqlite3_bind_zeroblob64(?*sqlite3_stmt, c_int, sqlite3_uint64) c_int;
pub extern fn sqlite3_bind_parameter_count(?*sqlite3_stmt) c_int;
pub extern fn sqlite3_bind_parameter_name(?*sqlite3_stmt, c_int) [*c]const u8;
pub extern fn sqlite3_bind_parameter_index(?*sqlite3_stmt, zName: [*c]const u8) c_int;
pub extern fn sqlite3_clear_bindings(?*sqlite3_stmt) c_int;
pub extern fn sqlite3_column_count(pStmt: ?*sqlite3_stmt) c_int;
pub extern fn sqlite3_column_name(?*sqlite3_stmt, N: c_int) [*c]const u8;
pub extern fn sqlite3_column_name16(?*sqlite3_stmt, N: c_int) ?*const anyopaque;
pub extern fn sqlite3_column_database_name(?*sqlite3_stmt, c_int) [*c]const u8;
pub extern fn sqlite3_column_database_name16(?*sqlite3_stmt, c_int) ?*const anyopaque;
pub extern fn sqlite3_column_table_name(?*sqlite3_stmt, c_int) [*c]const u8;
pub extern fn sqlite3_column_table_name16(?*sqlite3_stmt, c_int) ?*const anyopaque;
pub extern fn sqlite3_column_origin_name(?*sqlite3_stmt, c_int) [*c]const u8;
pub extern fn sqlite3_column_origin_name16(?*sqlite3_stmt, c_int) ?*const anyopaque;
pub extern fn sqlite3_column_decltype(?*sqlite3_stmt, c_int) [*c]const u8;
pub extern fn sqlite3_column_decltype16(?*sqlite3_stmt, c_int) ?*const anyopaque;
pub extern fn sqlite3_step(?*sqlite3_stmt) c_int;
pub extern fn sqlite3_data_count(pStmt: ?*sqlite3_stmt) c_int;
pub extern fn sqlite3_column_blob(?*sqlite3_stmt, iCol: c_int) ?*const anyopaque;
pub extern fn sqlite3_column_double(?*sqlite3_stmt, iCol: c_int) f64;
pub extern fn sqlite3_column_int(?*sqlite3_stmt, iCol: c_int) c_int;
pub extern fn sqlite3_column_int64(?*sqlite3_stmt, iCol: c_int) sqlite3_int64;
pub extern fn sqlite3_column_text(?*sqlite3_stmt, iCol: c_int) [*c]const u8;
pub extern fn sqlite3_column_text16(?*sqlite3_stmt, iCol: c_int) ?*const anyopaque;
pub extern fn sqlite3_column_value(?*sqlite3_stmt, iCol: c_int) ?*sqlite3_value;
pub extern fn sqlite3_column_bytes(?*sqlite3_stmt, iCol: c_int) c_int;
pub extern fn sqlite3_column_bytes16(?*sqlite3_stmt, iCol: c_int) c_int;
pub extern fn sqlite3_column_type(?*sqlite3_stmt, iCol: c_int) c_int;
pub extern fn sqlite3_finalize(pStmt: ?*sqlite3_stmt) c_int;
pub extern fn sqlite3_reset(pStmt: ?*sqlite3_stmt) c_int;
pub extern fn sqlite3_create_function(db: ?*sqlite3, zFunctionName: [*c]const u8, nArg: c_int, eTextRep: c_int, pApp: ?*anyopaque, xFunc: ?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, xStep: ?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, xFinal: ?*const fn (?*sqlite3_context) callconv(.c) void) c_int;
pub extern fn sqlite3_create_function16(db: ?*sqlite3, zFunctionName: ?*const anyopaque, nArg: c_int, eTextRep: c_int, pApp: ?*anyopaque, xFunc: ?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, xStep: ?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, xFinal: ?*const fn (?*sqlite3_context) callconv(.c) void) c_int;
pub extern fn sqlite3_create_function_v2(db: ?*sqlite3, zFunctionName: [*c]const u8, nArg: c_int, eTextRep: c_int, pApp: ?*anyopaque, xFunc: ?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, xStep: ?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, xFinal: ?*const fn (?*sqlite3_context) callconv(.c) void, xDestroy: ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_create_window_function(db: ?*sqlite3, zFunctionName: [*c]const u8, nArg: c_int, eTextRep: c_int, pApp: ?*anyopaque, xStep: ?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, xFinal: ?*const fn (?*sqlite3_context) callconv(.c) void, xValue: ?*const fn (?*sqlite3_context) callconv(.c) void, xInverse: ?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, xDestroy: ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_aggregate_count(?*sqlite3_context) c_int;
pub extern fn sqlite3_expired(?*sqlite3_stmt) c_int;
pub extern fn sqlite3_transfer_bindings(?*sqlite3_stmt, ?*sqlite3_stmt) c_int;
pub extern fn sqlite3_global_recover() c_int;
pub extern fn sqlite3_thread_cleanup() void;
pub extern fn sqlite3_memory_alarm(?*const fn (?*anyopaque, sqlite3_int64, c_int) callconv(.c) void, ?*anyopaque, sqlite3_int64) c_int;
pub extern fn sqlite3_value_blob(?*sqlite3_value) ?*const anyopaque;
pub extern fn sqlite3_value_double(?*sqlite3_value) f64;
pub extern fn sqlite3_value_int(?*sqlite3_value) c_int;
pub extern fn sqlite3_value_int64(?*sqlite3_value) sqlite3_int64;
pub extern fn sqlite3_value_pointer(?*sqlite3_value, [*c]const u8) ?*anyopaque;
pub extern fn sqlite3_value_text(?*sqlite3_value) [*c]const u8;
pub extern fn sqlite3_value_text16(?*sqlite3_value) ?*const anyopaque;
pub extern fn sqlite3_value_text16le(?*sqlite3_value) ?*const anyopaque;
pub extern fn sqlite3_value_text16be(?*sqlite3_value) ?*const anyopaque;
pub extern fn sqlite3_value_bytes(?*sqlite3_value) c_int;
pub extern fn sqlite3_value_bytes16(?*sqlite3_value) c_int;
pub extern fn sqlite3_value_type(?*sqlite3_value) c_int;
pub extern fn sqlite3_value_numeric_type(?*sqlite3_value) c_int;
pub extern fn sqlite3_value_nochange(?*sqlite3_value) c_int;
pub extern fn sqlite3_value_frombind(?*sqlite3_value) c_int;
pub extern fn sqlite3_value_encoding(?*sqlite3_value) c_int;
pub extern fn sqlite3_value_subtype(?*sqlite3_value) c_uint;
pub extern fn sqlite3_value_dup(?*const sqlite3_value) ?*sqlite3_value;
pub extern fn sqlite3_value_free(?*sqlite3_value) void;
pub extern fn sqlite3_aggregate_context(?*sqlite3_context, nBytes: c_int) ?*anyopaque;
pub extern fn sqlite3_user_data(?*sqlite3_context) ?*anyopaque;
pub extern fn sqlite3_context_db_handle(?*sqlite3_context) ?*sqlite3;
pub extern fn sqlite3_get_auxdata(?*sqlite3_context, N: c_int) ?*anyopaque;
pub extern fn sqlite3_set_auxdata(?*sqlite3_context, N: c_int, ?*anyopaque, ?*const fn (?*anyopaque) callconv(.c) void) void;
pub extern fn sqlite3_get_clientdata(?*sqlite3, [*c]const u8) ?*anyopaque;
pub extern fn sqlite3_set_clientdata(?*sqlite3, [*c]const u8, ?*anyopaque, ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub const sqlite3_destructor_type = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn sqlite3_result_blob(?*sqlite3_context, ?*const anyopaque, c_int, ?*const fn (?*anyopaque) callconv(.c) void) void;
pub extern fn sqlite3_result_blob64(?*sqlite3_context, ?*const anyopaque, sqlite3_uint64, ?*const fn (?*anyopaque) callconv(.c) void) void;
pub extern fn sqlite3_result_double(?*sqlite3_context, f64) void;
pub extern fn sqlite3_result_error(?*sqlite3_context, [*c]const u8, c_int) void;
pub extern fn sqlite3_result_error16(?*sqlite3_context, ?*const anyopaque, c_int) void;
pub extern fn sqlite3_result_error_toobig(?*sqlite3_context) void;
pub extern fn sqlite3_result_error_nomem(?*sqlite3_context) void;
pub extern fn sqlite3_result_error_code(?*sqlite3_context, c_int) void;
pub extern fn sqlite3_result_int(?*sqlite3_context, c_int) void;
pub extern fn sqlite3_result_int64(?*sqlite3_context, sqlite3_int64) void;
pub extern fn sqlite3_result_null(?*sqlite3_context) void;
pub extern fn sqlite3_result_text(?*sqlite3_context, [*c]const u8, c_int, ?*const fn (?*anyopaque) callconv(.c) void) void;
pub extern fn sqlite3_result_text64(?*sqlite3_context, [*c]const u8, sqlite3_uint64, ?*const fn (?*anyopaque) callconv(.c) void, encoding: u8) void;
pub extern fn sqlite3_result_text16(?*sqlite3_context, ?*const anyopaque, c_int, ?*const fn (?*anyopaque) callconv(.c) void) void;
pub extern fn sqlite3_result_text16le(?*sqlite3_context, ?*const anyopaque, c_int, ?*const fn (?*anyopaque) callconv(.c) void) void;
pub extern fn sqlite3_result_text16be(?*sqlite3_context, ?*const anyopaque, c_int, ?*const fn (?*anyopaque) callconv(.c) void) void;
pub extern fn sqlite3_result_value(?*sqlite3_context, ?*sqlite3_value) void;
pub extern fn sqlite3_result_pointer(?*sqlite3_context, ?*anyopaque, [*c]const u8, ?*const fn (?*anyopaque) callconv(.c) void) void;
pub extern fn sqlite3_result_zeroblob(?*sqlite3_context, n: c_int) void;
pub extern fn sqlite3_result_zeroblob64(?*sqlite3_context, n: sqlite3_uint64) c_int;
pub extern fn sqlite3_result_subtype(?*sqlite3_context, c_uint) void;
pub extern fn sqlite3_create_collation(?*sqlite3, zName: [*c]const u8, eTextRep: c_int, pArg: ?*anyopaque, xCompare: ?*const fn (?*anyopaque, c_int, ?*const anyopaque, c_int, ?*const anyopaque) callconv(.c) c_int) c_int;
pub extern fn sqlite3_create_collation_v2(?*sqlite3, zName: [*c]const u8, eTextRep: c_int, pArg: ?*anyopaque, xCompare: ?*const fn (?*anyopaque, c_int, ?*const anyopaque, c_int, ?*const anyopaque) callconv(.c) c_int, xDestroy: ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_create_collation16(?*sqlite3, zName: ?*const anyopaque, eTextRep: c_int, pArg: ?*anyopaque, xCompare: ?*const fn (?*anyopaque, c_int, ?*const anyopaque, c_int, ?*const anyopaque) callconv(.c) c_int) c_int;
pub extern fn sqlite3_collation_needed(?*sqlite3, ?*anyopaque, ?*const fn (?*anyopaque, ?*sqlite3, eTextRep: c_int, [*c]const u8) callconv(.c) void) c_int;
pub extern fn sqlite3_collation_needed16(?*sqlite3, ?*anyopaque, ?*const fn (?*anyopaque, ?*sqlite3, eTextRep: c_int, ?*const anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_sleep(c_int) c_int;
pub extern var sqlite3_temp_directory: [*c]u8;
pub extern var sqlite3_data_directory: [*c]u8;
pub extern fn sqlite3_win32_set_directory(@"type": c_ulong, zValue: ?*anyopaque) c_int;
pub extern fn sqlite3_win32_set_directory8(@"type": c_ulong, zValue: [*c]const u8) c_int;
pub extern fn sqlite3_win32_set_directory16(@"type": c_ulong, zValue: ?*const anyopaque) c_int;
pub extern fn sqlite3_get_autocommit(?*sqlite3) c_int;
pub extern fn sqlite3_db_handle(?*sqlite3_stmt) ?*sqlite3;
pub extern fn sqlite3_db_name(db: ?*sqlite3, N: c_int) [*c]const u8;
pub extern fn sqlite3_db_filename(db: ?*sqlite3, zDbName: [*c]const u8) sqlite3_filename;
pub extern fn sqlite3_db_readonly(db: ?*sqlite3, zDbName: [*c]const u8) c_int;
pub extern fn sqlite3_txn_state(?*sqlite3, zSchema: [*c]const u8) c_int;
pub extern fn sqlite3_next_stmt(pDb: ?*sqlite3, pStmt: ?*sqlite3_stmt) ?*sqlite3_stmt;
pub extern fn sqlite3_commit_hook(?*sqlite3, ?*const fn (?*anyopaque) callconv(.c) c_int, ?*anyopaque) ?*anyopaque;
pub extern fn sqlite3_rollback_hook(?*sqlite3, ?*const fn (?*anyopaque) callconv(.c) void, ?*anyopaque) ?*anyopaque;
pub extern fn sqlite3_autovacuum_pages(db: ?*sqlite3, ?*const fn (?*anyopaque, [*c]const u8, c_uint, c_uint, c_uint) callconv(.c) c_uint, ?*anyopaque, ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_update_hook(?*sqlite3, ?*const fn (?*anyopaque, c_int, [*c]const u8, [*c]const u8, sqlite3_int64) callconv(.c) void, ?*anyopaque) ?*anyopaque;
pub extern fn sqlite3_enable_shared_cache(c_int) c_int;
pub extern fn sqlite3_release_memory(c_int) c_int;
pub extern fn sqlite3_db_release_memory(?*sqlite3) c_int;
pub extern fn sqlite3_soft_heap_limit64(N: sqlite3_int64) sqlite3_int64;
pub extern fn sqlite3_hard_heap_limit64(N: sqlite3_int64) sqlite3_int64;
pub extern fn sqlite3_soft_heap_limit(N: c_int) void;
pub extern fn sqlite3_table_column_metadata(db: ?*sqlite3, zDbName: [*c]const u8, zTableName: [*c]const u8, zColumnName: [*c]const u8, pzDataType: [*c][*c]const u8, pzCollSeq: [*c][*c]const u8, pNotNull: [*c]c_int, pPrimaryKey: [*c]c_int, pAutoinc: [*c]c_int) c_int;
pub extern fn sqlite3_load_extension(db: ?*sqlite3, zFile: [*c]const u8, zProc: [*c]const u8, pzErrMsg: [*c][*c]u8) c_int;
pub extern fn sqlite3_enable_load_extension(db: ?*sqlite3, onoff: c_int) c_int;
pub extern fn sqlite3_auto_extension(xEntryPoint: ?*const fn () callconv(.c) void) c_int;
pub extern fn sqlite3_cancel_auto_extension(xEntryPoint: ?*const fn () callconv(.c) void) c_int;
pub extern fn sqlite3_reset_auto_extension() void;
pub const sqlite3_vtab = struct_sqlite3_vtab;
pub const struct_sqlite3_index_constraint_3 = extern struct {
    iColumn: c_int = 0,
    op: u8 = 0,
    usable: u8 = 0,
    iTermOffset: c_int = 0,
};
pub const struct_sqlite3_index_orderby_4 = extern struct {
    iColumn: c_int = 0,
    desc: u8 = 0,
};
pub const struct_sqlite3_index_constraint_usage_5 = extern struct {
    argvIndex: c_int = 0,
    omit: u8 = 0,
};
pub const struct_sqlite3_index_info = extern struct {
    nConstraint: c_int = 0,
    aConstraint: [*c]struct_sqlite3_index_constraint_3 = null,
    nOrderBy: c_int = 0,
    aOrderBy: [*c]struct_sqlite3_index_orderby_4 = null,
    aConstraintUsage: [*c]struct_sqlite3_index_constraint_usage_5 = null,
    idxNum: c_int = 0,
    idxStr: [*c]u8 = null,
    needToFreeIdxStr: c_int = 0,
    orderByConsumed: c_int = 0,
    estimatedCost: f64 = 0,
    estimatedRows: sqlite3_int64 = 0,
    idxFlags: c_int = 0,
    colUsed: sqlite3_uint64 = 0,
    pub const sqlite3_vtab_collation = __root.sqlite3_vtab_collation;
    pub const sqlite3_vtab_distinct = __root.sqlite3_vtab_distinct;
    pub const sqlite3_vtab_in = __root.sqlite3_vtab_in;
    pub const sqlite3_vtab_rhs_value = __root.sqlite3_vtab_rhs_value;
    pub const collation = __root.sqlite3_vtab_collation;
    pub const distinct = __root.sqlite3_vtab_distinct;
    pub const in = __root.sqlite3_vtab_in;
    pub const value = __root.sqlite3_vtab_rhs_value;
};
pub const sqlite3_index_info = struct_sqlite3_index_info;
pub const struct_sqlite3_vtab_cursor = extern struct {
    pVtab: [*c]sqlite3_vtab = null,
};
pub const sqlite3_vtab_cursor = struct_sqlite3_vtab_cursor;
pub const struct_sqlite3_module = extern struct {
    iVersion: c_int = 0,
    xCreate: ?*const fn (?*sqlite3, pAux: ?*anyopaque, argc: c_int, argv: [*c]const [*c]const u8, ppVTab: [*c][*c]sqlite3_vtab, [*c][*c]u8) callconv(.c) c_int = null,
    xConnect: ?*const fn (?*sqlite3, pAux: ?*anyopaque, argc: c_int, argv: [*c]const [*c]const u8, ppVTab: [*c][*c]sqlite3_vtab, [*c][*c]u8) callconv(.c) c_int = null,
    xBestIndex: ?*const fn (pVTab: [*c]sqlite3_vtab, [*c]sqlite3_index_info) callconv(.c) c_int = null,
    xDisconnect: ?*const fn (pVTab: [*c]sqlite3_vtab) callconv(.c) c_int = null,
    xDestroy: ?*const fn (pVTab: [*c]sqlite3_vtab) callconv(.c) c_int = null,
    xOpen: ?*const fn (pVTab: [*c]sqlite3_vtab, ppCursor: [*c][*c]sqlite3_vtab_cursor) callconv(.c) c_int = null,
    xClose: ?*const fn ([*c]sqlite3_vtab_cursor) callconv(.c) c_int = null,
    xFilter: ?*const fn ([*c]sqlite3_vtab_cursor, idxNum: c_int, idxStr: [*c]const u8, argc: c_int, argv: [*c]?*sqlite3_value) callconv(.c) c_int = null,
    xNext: ?*const fn ([*c]sqlite3_vtab_cursor) callconv(.c) c_int = null,
    xEof: ?*const fn ([*c]sqlite3_vtab_cursor) callconv(.c) c_int = null,
    xColumn: ?*const fn ([*c]sqlite3_vtab_cursor, ?*sqlite3_context, c_int) callconv(.c) c_int = null,
    xRowid: ?*const fn ([*c]sqlite3_vtab_cursor, pRowid: [*c]sqlite3_int64) callconv(.c) c_int = null,
    xUpdate: ?*const fn ([*c]sqlite3_vtab, c_int, [*c]?*sqlite3_value, [*c]sqlite3_int64) callconv(.c) c_int = null,
    xBegin: ?*const fn (pVTab: [*c]sqlite3_vtab) callconv(.c) c_int = null,
    xSync: ?*const fn (pVTab: [*c]sqlite3_vtab) callconv(.c) c_int = null,
    xCommit: ?*const fn (pVTab: [*c]sqlite3_vtab) callconv(.c) c_int = null,
    xRollback: ?*const fn (pVTab: [*c]sqlite3_vtab) callconv(.c) c_int = null,
    xFindFunction: ?*const fn (pVtab: [*c]sqlite3_vtab, nArg: c_int, zName: [*c]const u8, pxFunc: [*c]?*const fn (?*sqlite3_context, c_int, [*c]?*sqlite3_value) callconv(.c) void, ppArg: [*c]?*anyopaque) callconv(.c) c_int = null,
    xRename: ?*const fn (pVtab: [*c]sqlite3_vtab, zNew: [*c]const u8) callconv(.c) c_int = null,
    xSavepoint: ?*const fn (pVTab: [*c]sqlite3_vtab, c_int) callconv(.c) c_int = null,
    xRelease: ?*const fn (pVTab: [*c]sqlite3_vtab, c_int) callconv(.c) c_int = null,
    xRollbackTo: ?*const fn (pVTab: [*c]sqlite3_vtab, c_int) callconv(.c) c_int = null,
    xShadowName: ?*const fn ([*c]const u8) callconv(.c) c_int = null,
    xIntegrity: ?*const fn (pVTab: [*c]sqlite3_vtab, zSchema: [*c]const u8, zTabName: [*c]const u8, mFlags: c_int, pzErr: [*c][*c]u8) callconv(.c) c_int = null,
};
pub const sqlite3_module = struct_sqlite3_module;
pub const struct_sqlite3_vtab = extern struct {
    pModule: [*c]const sqlite3_module = null,
    nRef: c_int = 0,
    zErrMsg: [*c]u8 = null,
};
pub extern fn sqlite3_create_module(db: ?*sqlite3, zName: [*c]const u8, p: [*c]const sqlite3_module, pClientData: ?*anyopaque) c_int;
pub extern fn sqlite3_create_module_v2(db: ?*sqlite3, zName: [*c]const u8, p: [*c]const sqlite3_module, pClientData: ?*anyopaque, xDestroy: ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn sqlite3_drop_modules(db: ?*sqlite3, azKeep: [*c][*c]const u8) c_int;
pub extern fn sqlite3_declare_vtab(?*sqlite3, zSQL: [*c]const u8) c_int;
pub extern fn sqlite3_overload_function(?*sqlite3, zFuncName: [*c]const u8, nArg: c_int) c_int;
pub const struct_sqlite3_blob = opaque {
    pub const sqlite3_blob_reopen = __root.sqlite3_blob_reopen;
    pub const sqlite3_blob_close = __root.sqlite3_blob_close;
    pub const sqlite3_blob_bytes = __root.sqlite3_blob_bytes;
    pub const sqlite3_blob_read = __root.sqlite3_blob_read;
    pub const sqlite3_blob_write = __root.sqlite3_blob_write;
    pub const reopen = __root.sqlite3_blob_reopen;
    pub const close = __root.sqlite3_blob_close;
    pub const bytes = __root.sqlite3_blob_bytes;
    pub const read = __root.sqlite3_blob_read;
    pub const write = __root.sqlite3_blob_write;
};
pub const sqlite3_blob = struct_sqlite3_blob;
pub extern fn sqlite3_blob_open(?*sqlite3, zDb: [*c]const u8, zTable: [*c]const u8, zColumn: [*c]const u8, iRow: sqlite3_int64, flags: c_int, ppBlob: [*c]?*sqlite3_blob) c_int;
pub extern fn sqlite3_blob_reopen(?*sqlite3_blob, sqlite3_int64) c_int;
pub extern fn sqlite3_blob_close(?*sqlite3_blob) c_int;
pub extern fn sqlite3_blob_bytes(?*sqlite3_blob) c_int;
pub extern fn sqlite3_blob_read(?*sqlite3_blob, Z: ?*anyopaque, N: c_int, iOffset: c_int) c_int;
pub extern fn sqlite3_blob_write(?*sqlite3_blob, z: ?*const anyopaque, n: c_int, iOffset: c_int) c_int;
pub extern fn sqlite3_vfs_find(zVfsName: [*c]const u8) [*c]sqlite3_vfs;
pub extern fn sqlite3_vfs_register([*c]sqlite3_vfs, makeDflt: c_int) c_int;
pub extern fn sqlite3_vfs_unregister([*c]sqlite3_vfs) c_int;
pub extern fn sqlite3_mutex_alloc(c_int) ?*sqlite3_mutex;
pub extern fn sqlite3_mutex_free(?*sqlite3_mutex) void;
pub extern fn sqlite3_mutex_enter(?*sqlite3_mutex) void;
pub extern fn sqlite3_mutex_try(?*sqlite3_mutex) c_int;
pub extern fn sqlite3_mutex_leave(?*sqlite3_mutex) void;
pub const struct_sqlite3_mutex_methods = extern struct {
    xMutexInit: ?*const fn () callconv(.c) c_int = null,
    xMutexEnd: ?*const fn () callconv(.c) c_int = null,
    xMutexAlloc: ?*const fn (c_int) callconv(.c) ?*sqlite3_mutex = null,
    xMutexFree: ?*const fn (?*sqlite3_mutex) callconv(.c) void = null,
    xMutexEnter: ?*const fn (?*sqlite3_mutex) callconv(.c) void = null,
    xMutexTry: ?*const fn (?*sqlite3_mutex) callconv(.c) c_int = null,
    xMutexLeave: ?*const fn (?*sqlite3_mutex) callconv(.c) void = null,
    xMutexHeld: ?*const fn (?*sqlite3_mutex) callconv(.c) c_int = null,
    xMutexNotheld: ?*const fn (?*sqlite3_mutex) callconv(.c) c_int = null,
};
pub const sqlite3_mutex_methods = struct_sqlite3_mutex_methods;
pub extern fn sqlite3_mutex_held(?*sqlite3_mutex) c_int;
pub extern fn sqlite3_mutex_notheld(?*sqlite3_mutex) c_int;
pub extern fn sqlite3_db_mutex(?*sqlite3) ?*sqlite3_mutex;
pub extern fn sqlite3_file_control(?*sqlite3, zDbName: [*c]const u8, op: c_int, ?*anyopaque) c_int;
pub extern fn sqlite3_test_control(op: c_int, ...) c_int;
pub extern fn sqlite3_keyword_count() c_int;
pub extern fn sqlite3_keyword_name(c_int, [*c][*c]const u8, [*c]c_int) c_int;
pub extern fn sqlite3_keyword_check([*c]const u8, c_int) c_int;
pub const struct_sqlite3_str = opaque {
    pub const sqlite3_str_finish = __root.sqlite3_str_finish;
    pub const sqlite3_str_appendf = __root.sqlite3_str_appendf;
    pub const sqlite3_str_vappendf = __root.sqlite3_str_vappendf;
    pub const sqlite3_str_append = __root.sqlite3_str_append;
    pub const sqlite3_str_appendall = __root.sqlite3_str_appendall;
    pub const sqlite3_str_appendchar = __root.sqlite3_str_appendchar;
    pub const sqlite3_str_reset = __root.sqlite3_str_reset;
    pub const sqlite3_str_errcode = __root.sqlite3_str_errcode;
    pub const sqlite3_str_length = __root.sqlite3_str_length;
    pub const sqlite3_str_value = __root.sqlite3_str_value;
    pub const finish = __root.sqlite3_str_finish;
    pub const appendf = __root.sqlite3_str_appendf;
    pub const vappendf = __root.sqlite3_str_vappendf;
    pub const append = __root.sqlite3_str_append;
    pub const appendall = __root.sqlite3_str_appendall;
    pub const appendchar = __root.sqlite3_str_appendchar;
    pub const reset = __root.sqlite3_str_reset;
    pub const errcode = __root.sqlite3_str_errcode;
    pub const length = __root.sqlite3_str_length;
    pub const value = __root.sqlite3_str_value;
};
pub const sqlite3_str = struct_sqlite3_str;
pub extern fn sqlite3_str_new(?*sqlite3) ?*sqlite3_str;
pub extern fn sqlite3_str_finish(?*sqlite3_str) [*c]u8;
pub extern fn sqlite3_str_appendf(?*sqlite3_str, zFormat: [*c]const u8, ...) void;
pub extern fn sqlite3_str_vappendf(?*sqlite3_str, zFormat: [*c]const u8, [*c]struct___va_list_tag_1) void;
pub extern fn sqlite3_str_append(?*sqlite3_str, zIn: [*c]const u8, N: c_int) void;
pub extern fn sqlite3_str_appendall(?*sqlite3_str, zIn: [*c]const u8) void;
pub extern fn sqlite3_str_appendchar(?*sqlite3_str, N: c_int, C: u8) void;
pub extern fn sqlite3_str_reset(?*sqlite3_str) void;
pub extern fn sqlite3_str_errcode(?*sqlite3_str) c_int;
pub extern fn sqlite3_str_length(?*sqlite3_str) c_int;
pub extern fn sqlite3_str_value(?*sqlite3_str) [*c]u8;
pub extern fn sqlite3_status(op: c_int, pCurrent: [*c]c_int, pHighwater: [*c]c_int, resetFlag: c_int) c_int;
pub extern fn sqlite3_status64(op: c_int, pCurrent: [*c]sqlite3_int64, pHighwater: [*c]sqlite3_int64, resetFlag: c_int) c_int;
pub extern fn sqlite3_db_status(?*sqlite3, op: c_int, pCur: [*c]c_int, pHiwtr: [*c]c_int, resetFlg: c_int) c_int;
pub extern fn sqlite3_db_status64(?*sqlite3, c_int, [*c]sqlite3_int64, [*c]sqlite3_int64, c_int) c_int;
pub extern fn sqlite3_stmt_status(?*sqlite3_stmt, op: c_int, resetFlg: c_int) c_int;
pub const struct_sqlite3_pcache = opaque {};
pub const sqlite3_pcache = struct_sqlite3_pcache;
pub const struct_sqlite3_pcache_page = extern struct {
    pBuf: ?*anyopaque = null,
    pExtra: ?*anyopaque = null,
};
pub const sqlite3_pcache_page = struct_sqlite3_pcache_page;
pub const struct_sqlite3_pcache_methods2 = extern struct {
    iVersion: c_int = 0,
    pArg: ?*anyopaque = null,
    xInit: ?*const fn (?*anyopaque) callconv(.c) c_int = null,
    xShutdown: ?*const fn (?*anyopaque) callconv(.c) void = null,
    xCreate: ?*const fn (szPage: c_int, szExtra: c_int, bPurgeable: c_int) callconv(.c) ?*sqlite3_pcache = null,
    xCachesize: ?*const fn (?*sqlite3_pcache, nCachesize: c_int) callconv(.c) void = null,
    xPagecount: ?*const fn (?*sqlite3_pcache) callconv(.c) c_int = null,
    xFetch: ?*const fn (?*sqlite3_pcache, key: c_uint, createFlag: c_int) callconv(.c) [*c]sqlite3_pcache_page = null,
    xUnpin: ?*const fn (?*sqlite3_pcache, [*c]sqlite3_pcache_page, discard: c_int) callconv(.c) void = null,
    xRekey: ?*const fn (?*sqlite3_pcache, [*c]sqlite3_pcache_page, oldKey: c_uint, newKey: c_uint) callconv(.c) void = null,
    xTruncate: ?*const fn (?*sqlite3_pcache, iLimit: c_uint) callconv(.c) void = null,
    xDestroy: ?*const fn (?*sqlite3_pcache) callconv(.c) void = null,
    xShrink: ?*const fn (?*sqlite3_pcache) callconv(.c) void = null,
};
pub const sqlite3_pcache_methods2 = struct_sqlite3_pcache_methods2;
pub const struct_sqlite3_pcache_methods = extern struct {
    pArg: ?*anyopaque = null,
    xInit: ?*const fn (?*anyopaque) callconv(.c) c_int = null,
    xShutdown: ?*const fn (?*anyopaque) callconv(.c) void = null,
    xCreate: ?*const fn (szPage: c_int, bPurgeable: c_int) callconv(.c) ?*sqlite3_pcache = null,
    xCachesize: ?*const fn (?*sqlite3_pcache, nCachesize: c_int) callconv(.c) void = null,
    xPagecount: ?*const fn (?*sqlite3_pcache) callconv(.c) c_int = null,
    xFetch: ?*const fn (?*sqlite3_pcache, key: c_uint, createFlag: c_int) callconv(.c) ?*anyopaque = null,
    xUnpin: ?*const fn (?*sqlite3_pcache, ?*anyopaque, discard: c_int) callconv(.c) void = null,
    xRekey: ?*const fn (?*sqlite3_pcache, ?*anyopaque, oldKey: c_uint, newKey: c_uint) callconv(.c) void = null,
    xTruncate: ?*const fn (?*sqlite3_pcache, iLimit: c_uint) callconv(.c) void = null,
    xDestroy: ?*const fn (?*sqlite3_pcache) callconv(.c) void = null,
};
pub const sqlite3_pcache_methods = struct_sqlite3_pcache_methods;
pub const struct_sqlite3_backup = opaque {
    pub const sqlite3_backup_step = __root.sqlite3_backup_step;
    pub const sqlite3_backup_finish = __root.sqlite3_backup_finish;
    pub const sqlite3_backup_remaining = __root.sqlite3_backup_remaining;
    pub const sqlite3_backup_pagecount = __root.sqlite3_backup_pagecount;
    pub const step = __root.sqlite3_backup_step;
    pub const finish = __root.sqlite3_backup_finish;
    pub const remaining = __root.sqlite3_backup_remaining;
    pub const pagecount = __root.sqlite3_backup_pagecount;
};
pub const sqlite3_backup = struct_sqlite3_backup;
pub extern fn sqlite3_backup_init(pDest: ?*sqlite3, zDestName: [*c]const u8, pSource: ?*sqlite3, zSourceName: [*c]const u8) ?*sqlite3_backup;
pub extern fn sqlite3_backup_step(p: ?*sqlite3_backup, nPage: c_int) c_int;
pub extern fn sqlite3_backup_finish(p: ?*sqlite3_backup) c_int;
pub extern fn sqlite3_backup_remaining(p: ?*sqlite3_backup) c_int;
pub extern fn sqlite3_backup_pagecount(p: ?*sqlite3_backup) c_int;
pub extern fn sqlite3_unlock_notify(pBlocked: ?*sqlite3, xNotify: ?*const fn (apArg: [*c]?*anyopaque, nArg: c_int) callconv(.c) void, pNotifyArg: ?*anyopaque) c_int;
pub extern fn sqlite3_stricmp([*c]const u8, [*c]const u8) c_int;
pub extern fn sqlite3_strnicmp([*c]const u8, [*c]const u8, c_int) c_int;
pub extern fn sqlite3_strglob(zGlob: [*c]const u8, zStr: [*c]const u8) c_int;
pub extern fn sqlite3_strlike(zGlob: [*c]const u8, zStr: [*c]const u8, cEsc: c_uint) c_int;
pub extern fn sqlite3_log(iErrCode: c_int, zFormat: [*c]const u8, ...) void;
pub extern fn sqlite3_wal_hook(?*sqlite3, ?*const fn (?*anyopaque, ?*sqlite3, [*c]const u8, c_int) callconv(.c) c_int, ?*anyopaque) ?*anyopaque;
pub extern fn sqlite3_wal_autocheckpoint(db: ?*sqlite3, N: c_int) c_int;
pub extern fn sqlite3_wal_checkpoint(db: ?*sqlite3, zDb: [*c]const u8) c_int;
pub extern fn sqlite3_wal_checkpoint_v2(db: ?*sqlite3, zDb: [*c]const u8, eMode: c_int, pnLog: [*c]c_int, pnCkpt: [*c]c_int) c_int;
pub extern fn sqlite3_vtab_config(?*sqlite3, op: c_int, ...) c_int;
pub extern fn sqlite3_vtab_on_conflict(?*sqlite3) c_int;
pub extern fn sqlite3_vtab_nochange(?*sqlite3_context) c_int;
pub extern fn sqlite3_vtab_collation([*c]sqlite3_index_info, c_int) [*c]const u8;
pub extern fn sqlite3_vtab_distinct([*c]sqlite3_index_info) c_int;
pub extern fn sqlite3_vtab_in([*c]sqlite3_index_info, iCons: c_int, bHandle: c_int) c_int;
pub extern fn sqlite3_vtab_in_first(pVal: ?*sqlite3_value, ppOut: [*c]?*sqlite3_value) c_int;
pub extern fn sqlite3_vtab_in_next(pVal: ?*sqlite3_value, ppOut: [*c]?*sqlite3_value) c_int;
pub extern fn sqlite3_vtab_rhs_value([*c]sqlite3_index_info, c_int, ppVal: [*c]?*sqlite3_value) c_int;
pub extern fn sqlite3_stmt_scanstatus(pStmt: ?*sqlite3_stmt, idx: c_int, iScanStatusOp: c_int, pOut: ?*anyopaque) c_int;
pub extern fn sqlite3_stmt_scanstatus_v2(pStmt: ?*sqlite3_stmt, idx: c_int, iScanStatusOp: c_int, flags: c_int, pOut: ?*anyopaque) c_int;
pub extern fn sqlite3_stmt_scanstatus_reset(?*sqlite3_stmt) void;
pub extern fn sqlite3_db_cacheflush(?*sqlite3) c_int;
pub extern fn sqlite3_system_errno(?*sqlite3) c_int;
pub const struct_sqlite3_snapshot = extern struct {
    hidden: [48]u8 = @import("std").mem.zeroes([48]u8),
    pub const sqlite3_snapshot_free = __root.sqlite3_snapshot_free;
    pub const sqlite3_snapshot_cmp = __root.sqlite3_snapshot_cmp;
    pub const free = __root.sqlite3_snapshot_free;
    pub const cmp = __root.sqlite3_snapshot_cmp;
};
pub const sqlite3_snapshot = struct_sqlite3_snapshot;
pub extern fn sqlite3_snapshot_get(db: ?*sqlite3, zSchema: [*c]const u8, ppSnapshot: [*c][*c]sqlite3_snapshot) c_int;
pub extern fn sqlite3_snapshot_open(db: ?*sqlite3, zSchema: [*c]const u8, pSnapshot: [*c]sqlite3_snapshot) c_int;
pub extern fn sqlite3_snapshot_free([*c]sqlite3_snapshot) void;
pub extern fn sqlite3_snapshot_cmp(p1: [*c]sqlite3_snapshot, p2: [*c]sqlite3_snapshot) c_int;
pub extern fn sqlite3_snapshot_recover(db: ?*sqlite3, zDb: [*c]const u8) c_int;
pub extern fn sqlite3_serialize(db: ?*sqlite3, zSchema: [*c]const u8, piSize: [*c]sqlite3_int64, mFlags: c_uint) [*c]u8;
pub extern fn sqlite3_deserialize(db: ?*sqlite3, zSchema: [*c]const u8, pData: [*c]u8, szDb: sqlite3_int64, szBuf: sqlite3_int64, mFlags: c_uint) c_int;
pub extern fn sqlite3_carray_bind(pStmt: ?*sqlite3_stmt, i: c_int, aData: ?*anyopaque, nData: c_int, mFlags: c_int, xDel: ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub const sqlite3_rtree_dbl = f64;
pub const struct_sqlite3_rtree_geometry = extern struct {
    pContext: ?*anyopaque = null,
    nParam: c_int = 0,
    aParam: [*c]sqlite3_rtree_dbl = null,
    pUser: ?*anyopaque = null,
    xDelUser: ?*const fn (?*anyopaque) callconv(.c) void = null,
};
pub const sqlite3_rtree_geometry = struct_sqlite3_rtree_geometry;
pub const struct_sqlite3_rtree_query_info = extern struct {
    pContext: ?*anyopaque = null,
    nParam: c_int = 0,
    aParam: [*c]sqlite3_rtree_dbl = null,
    pUser: ?*anyopaque = null,
    xDelUser: ?*const fn (?*anyopaque) callconv(.c) void = null,
    aCoord: [*c]sqlite3_rtree_dbl = null,
    anQueue: [*c]c_uint = null,
    nCoord: c_int = 0,
    iLevel: c_int = 0,
    mxLevel: c_int = 0,
    iRowid: sqlite3_int64 = 0,
    rParentScore: sqlite3_rtree_dbl = 0,
    eParentWithin: c_int = 0,
    eWithin: c_int = 0,
    rScore: sqlite3_rtree_dbl = 0,
    apSqlParam: [*c]?*sqlite3_value = null,
};
pub const sqlite3_rtree_query_info = struct_sqlite3_rtree_query_info;
pub extern fn sqlite3_rtree_geometry_callback(db: ?*sqlite3, zGeom: [*c]const u8, xGeom: ?*const fn ([*c]sqlite3_rtree_geometry, c_int, [*c]sqlite3_rtree_dbl, [*c]c_int) callconv(.c) c_int, pContext: ?*anyopaque) c_int;
pub extern fn sqlite3_rtree_query_callback(db: ?*sqlite3, zQueryFunc: [*c]const u8, xQueryFunc: ?*const fn ([*c]sqlite3_rtree_query_info) callconv(.c) c_int, pContext: ?*anyopaque, xDestructor: ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub const struct_Fts5Context = opaque {};
pub const Fts5Context = struct_Fts5Context;
pub const Fts5ExtensionApi = struct_Fts5ExtensionApi;
pub const struct_Fts5PhraseIter = extern struct {
    a: [*c]const u8 = null,
    b: [*c]const u8 = null,
};
pub const Fts5PhraseIter = struct_Fts5PhraseIter;
pub const struct_Fts5ExtensionApi = extern struct {
    iVersion: c_int = 0,
    xUserData: ?*const fn (?*Fts5Context) callconv(.c) ?*anyopaque = null,
    xColumnCount: ?*const fn (?*Fts5Context) callconv(.c) c_int = null,
    xRowCount: ?*const fn (?*Fts5Context, pnRow: [*c]sqlite3_int64) callconv(.c) c_int = null,
    xColumnTotalSize: ?*const fn (?*Fts5Context, iCol: c_int, pnToken: [*c]sqlite3_int64) callconv(.c) c_int = null,
    xTokenize: ?*const fn (?*Fts5Context, pText: [*c]const u8, nText: c_int, pCtx: ?*anyopaque, xToken: ?*const fn (?*anyopaque, c_int, [*c]const u8, c_int, c_int, c_int) callconv(.c) c_int) callconv(.c) c_int = null,
    xPhraseCount: ?*const fn (?*Fts5Context) callconv(.c) c_int = null,
    xPhraseSize: ?*const fn (?*Fts5Context, iPhrase: c_int) callconv(.c) c_int = null,
    xInstCount: ?*const fn (?*Fts5Context, pnInst: [*c]c_int) callconv(.c) c_int = null,
    xInst: ?*const fn (?*Fts5Context, iIdx: c_int, piPhrase: [*c]c_int, piCol: [*c]c_int, piOff: [*c]c_int) callconv(.c) c_int = null,
    xRowid: ?*const fn (?*Fts5Context) callconv(.c) sqlite3_int64 = null,
    xColumnText: ?*const fn (?*Fts5Context, iCol: c_int, pz: [*c][*c]const u8, pn: [*c]c_int) callconv(.c) c_int = null,
    xColumnSize: ?*const fn (?*Fts5Context, iCol: c_int, pnToken: [*c]c_int) callconv(.c) c_int = null,
    xQueryPhrase: ?*const fn (?*Fts5Context, iPhrase: c_int, pUserData: ?*anyopaque, ?*const fn ([*c]const Fts5ExtensionApi, ?*Fts5Context, ?*anyopaque) callconv(.c) c_int) callconv(.c) c_int = null,
    xSetAuxdata: ?*const fn (?*Fts5Context, pAux: ?*anyopaque, xDelete: ?*const fn (?*anyopaque) callconv(.c) void) callconv(.c) c_int = null,
    xGetAuxdata: ?*const fn (?*Fts5Context, bClear: c_int) callconv(.c) ?*anyopaque = null,
    xPhraseFirst: ?*const fn (?*Fts5Context, iPhrase: c_int, [*c]Fts5PhraseIter, [*c]c_int, [*c]c_int) callconv(.c) c_int = null,
    xPhraseNext: ?*const fn (?*Fts5Context, [*c]Fts5PhraseIter, piCol: [*c]c_int, piOff: [*c]c_int) callconv(.c) void = null,
    xPhraseFirstColumn: ?*const fn (?*Fts5Context, iPhrase: c_int, [*c]Fts5PhraseIter, [*c]c_int) callconv(.c) c_int = null,
    xPhraseNextColumn: ?*const fn (?*Fts5Context, [*c]Fts5PhraseIter, piCol: [*c]c_int) callconv(.c) void = null,
    xQueryToken: ?*const fn (?*Fts5Context, iPhrase: c_int, iToken: c_int, ppToken: [*c][*c]const u8, pnToken: [*c]c_int) callconv(.c) c_int = null,
    xInstToken: ?*const fn (?*Fts5Context, iIdx: c_int, iToken: c_int, [*c][*c]const u8, [*c]c_int) callconv(.c) c_int = null,
    xColumnLocale: ?*const fn (?*Fts5Context, iCol: c_int, pz: [*c][*c]const u8, pn: [*c]c_int) callconv(.c) c_int = null,
    xTokenize_v2: ?*const fn (?*Fts5Context, pText: [*c]const u8, nText: c_int, pLocale: [*c]const u8, nLocale: c_int, pCtx: ?*anyopaque, xToken: ?*const fn (?*anyopaque, c_int, [*c]const u8, c_int, c_int, c_int) callconv(.c) c_int) callconv(.c) c_int = null,
};
pub const fts5_extension_function = ?*const fn (pApi: [*c]const Fts5ExtensionApi, pFts: ?*Fts5Context, pCtx: ?*sqlite3_context, nVal: c_int, apVal: [*c]?*sqlite3_value) callconv(.c) void;
pub const struct_Fts5Tokenizer = opaque {};
pub const Fts5Tokenizer = struct_Fts5Tokenizer;
pub const struct_fts5_tokenizer_v2 = extern struct {
    iVersion: c_int = 0,
    xCreate: ?*const fn (?*anyopaque, azArg: [*c][*c]const u8, nArg: c_int, ppOut: [*c]?*Fts5Tokenizer) callconv(.c) c_int = null,
    xDelete: ?*const fn (?*Fts5Tokenizer) callconv(.c) void = null,
    xTokenize: ?*const fn (?*Fts5Tokenizer, pCtx: ?*anyopaque, flags: c_int, pText: [*c]const u8, nText: c_int, pLocale: [*c]const u8, nLocale: c_int, xToken: ?*const fn (pCtx: ?*anyopaque, tflags: c_int, pToken: [*c]const u8, nToken: c_int, iStart: c_int, iEnd: c_int) callconv(.c) c_int) callconv(.c) c_int = null,
};
pub const fts5_tokenizer_v2 = struct_fts5_tokenizer_v2;
pub const struct_fts5_tokenizer = extern struct {
    xCreate: ?*const fn (?*anyopaque, azArg: [*c][*c]const u8, nArg: c_int, ppOut: [*c]?*Fts5Tokenizer) callconv(.c) c_int = null,
    xDelete: ?*const fn (?*Fts5Tokenizer) callconv(.c) void = null,
    xTokenize: ?*const fn (?*Fts5Tokenizer, pCtx: ?*anyopaque, flags: c_int, pText: [*c]const u8, nText: c_int, xToken: ?*const fn (pCtx: ?*anyopaque, tflags: c_int, pToken: [*c]const u8, nToken: c_int, iStart: c_int, iEnd: c_int) callconv(.c) c_int) callconv(.c) c_int = null,
};
pub const fts5_tokenizer = struct_fts5_tokenizer;
pub const fts5_api = struct_fts5_api;
pub const struct_fts5_api = extern struct {
    iVersion: c_int = 0,
    xCreateTokenizer: ?*const fn (pApi: [*c]fts5_api, zName: [*c]const u8, pUserData: ?*anyopaque, pTokenizer: [*c]fts5_tokenizer, xDestroy: ?*const fn (?*anyopaque) callconv(.c) void) callconv(.c) c_int = null,
    xFindTokenizer: ?*const fn (pApi: [*c]fts5_api, zName: [*c]const u8, ppUserData: [*c]?*anyopaque, pTokenizer: [*c]fts5_tokenizer) callconv(.c) c_int = null,
    xCreateFunction: ?*const fn (pApi: [*c]fts5_api, zName: [*c]const u8, pUserData: ?*anyopaque, xFunction: fts5_extension_function, xDestroy: ?*const fn (?*anyopaque) callconv(.c) void) callconv(.c) c_int = null,
    xCreateTokenizer_v2: ?*const fn (pApi: [*c]fts5_api, zName: [*c]const u8, pUserData: ?*anyopaque, pTokenizer: [*c]fts5_tokenizer_v2, xDestroy: ?*const fn (?*anyopaque) callconv(.c) void) callconv(.c) c_int = null,
    xFindTokenizer_v2: ?*const fn (pApi: [*c]fts5_api, zName: [*c]const u8, ppUserData: [*c]?*anyopaque, ppTokenizer: [*c][*c]fts5_tokenizer_v2) callconv(.c) c_int = null,
};
pub const rl_command_func_t = fn (c_int, c_int) callconv(.c) c_int;
pub const rl_compentry_func_t = fn ([*c]const u8, c_int) callconv(.c) [*c]u8;
pub const rl_completion_func_t = fn ([*c]const u8, c_int, c_int) callconv(.c) [*c][*c]u8;
pub const rl_quote_func_t = fn ([*c]u8, c_int, [*c]u8) callconv(.c) [*c]u8;
pub const rl_dequote_func_t = fn ([*c]u8, c_int) callconv(.c) [*c]u8;
pub const rl_compignore_func_t = fn ([*c][*c]u8) callconv(.c) c_int;
pub const rl_compdisp_func_t = fn ([*c][*c]u8, c_int, c_int) callconv(.c) void;
pub const rl_macro_print_func_t = fn ([*c]const u8, [*c]const u8, c_int, [*c]const u8) callconv(.c) void;
pub const rl_hook_func_t = fn () callconv(.c) c_int;
pub const rl_getc_func_t = fn (?*FILE) callconv(.c) c_int;
pub const rl_linebuf_func_t = fn ([*c]u8, c_int) callconv(.c) c_int;
pub const rl_intfunc_t = fn (c_int) callconv(.c) c_int;
pub const rl_icpfunc_t = fn ([*c]u8) callconv(.c) c_int;
pub const rl_icppfunc_t = fn ([*c][*c]u8) callconv(.c) c_int;
pub const rl_voidfunc_t = fn () callconv(.c) void;
pub const rl_vintfunc_t = fn (c_int) callconv(.c) void;
pub const rl_vcpfunc_t = fn ([*c]u8) callconv(.c) void;
pub const rl_vcppfunc_t = fn ([*c][*c]u8) callconv(.c) void;
pub const rl_cpvfunc_t = fn () callconv(.c) [*c]u8;
pub const rl_cpifunc_t = fn (c_int) callconv(.c) [*c]u8;
pub const rl_cpcpfunc_t = fn ([*c]u8) callconv(.c) [*c]u8;
pub const rl_cpcppfunc_t = fn ([*c][*c]u8) callconv(.c) [*c]u8;
pub const _ISupper: c_int = 256;
pub const _ISlower: c_int = 512;
pub const _ISalpha: c_int = 1024;
pub const _ISdigit: c_int = 2048;
pub const _ISxdigit: c_int = 4096;
pub const _ISspace: c_int = 8192;
pub const _ISprint: c_int = 16384;
pub const _ISgraph: c_int = 32768;
pub const _ISblank: c_int = 1;
pub const _IScntrl: c_int = 2;
pub const _ISpunct: c_int = 4;
pub const _ISalnum: c_int = 8;
const enum_unnamed_6 = c_uint;
pub extern fn __ctype_b_loc() [*c][*c]const c_ushort;
pub extern fn __ctype_tolower_loc() [*c][*c]const __int32_t;
pub extern fn __ctype_toupper_loc() [*c][*c]const __int32_t;
pub extern fn isalnum(c_int) c_int;
pub extern fn isalpha(c_int) c_int;
pub extern fn iscntrl(c_int) c_int;
pub extern fn isdigit(c_int) c_int;
pub extern fn islower(c_int) c_int;
pub extern fn isgraph(c_int) c_int;
pub extern fn isprint(c_int) c_int;
pub extern fn ispunct(c_int) c_int;
pub extern fn isspace(c_int) c_int;
pub extern fn isupper(c_int) c_int;
pub extern fn isxdigit(c_int) c_int;
pub extern fn tolower(__c: c_int) c_int;
pub extern fn toupper(__c: c_int) c_int;
pub extern fn isblank(c_int) c_int;
pub extern fn isascii(__c: c_int) c_int;
pub extern fn toascii(__c: c_int) c_int;
pub extern fn _toupper(c_int) c_int;
pub extern fn _tolower(c_int) c_int;
pub const struct___locale_data_7 = opaque {};
pub const struct___locale_struct = extern struct {
    __locales: [13]?*struct___locale_data_7 = @import("std").mem.zeroes([13]?*struct___locale_data_7),
    __ctype_b: [*c]const c_ushort = null,
    __ctype_tolower: [*c]const c_int = null,
    __ctype_toupper: [*c]const c_int = null,
    __names: [13][*c]const u8 = @import("std").mem.zeroes([13][*c]const u8),
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn isalnum_l(c_int, locale_t) c_int;
pub extern fn isalpha_l(c_int, locale_t) c_int;
pub extern fn iscntrl_l(c_int, locale_t) c_int;
pub extern fn isdigit_l(c_int, locale_t) c_int;
pub extern fn islower_l(c_int, locale_t) c_int;
pub extern fn isgraph_l(c_int, locale_t) c_int;
pub extern fn isprint_l(c_int, locale_t) c_int;
pub extern fn ispunct_l(c_int, locale_t) c_int;
pub extern fn isspace_l(c_int, locale_t) c_int;
pub extern fn isupper_l(c_int, locale_t) c_int;
pub extern fn isxdigit_l(c_int, locale_t) c_int;
pub extern fn isblank_l(c_int, locale_t) c_int;
pub extern fn __tolower_l(__c: c_int, __l: locale_t) c_int;
pub extern fn tolower_l(__c: c_int, __l: locale_t) c_int;
pub extern fn __toupper_l(__c: c_int, __l: locale_t) c_int;
pub extern fn toupper_l(__c: c_int, __l: locale_t) c_int;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memccpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn memcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn __memcmpeq(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn memchr(__s: ?*const anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn strncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strcat(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn strncat(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strxfrm(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) usize;
pub extern fn strcoll_l(__s1: [*c]const u8, __s2: [*c]const u8, __l: locale_t) c_int;
pub extern fn strxfrm_l(__dest: [*c]u8, __src: [*c]const u8, __n: usize, __l: locale_t) usize;
pub extern fn strdup(__s: [*c]const u8) [*c]u8;
pub extern fn strndup(__string: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strchrnul(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __reject: [*c]const u8) usize;
pub extern fn strspn(__s: [*c]const u8, __accept: [*c]const u8) usize;
pub extern fn strpbrk(__s: [*c]const u8, __accept: [*c]const u8) [*c]u8;
pub extern fn strstr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn strtok(noalias __s: [*c]u8, noalias __delim: [*c]const u8) [*c]u8;
pub extern fn __strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strcasestr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn memmem(__haystack: ?*const anyopaque, __haystacklen: usize, __needle: ?*const anyopaque, __needlelen: usize) ?*anyopaque;
pub extern fn __mempcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn mempcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn strlen(__s: [*c]const u8) usize;
pub extern fn strnlen(__string: [*c]const u8, __maxlen: usize) usize;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn strerror_l(__errnum: c_int, __l: locale_t) [*c]u8;
pub extern fn bcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn bcopy(__src: ?*const anyopaque, __dest: ?*anyopaque, __n: usize) void;
pub extern fn bzero(__s: ?*anyopaque, __n: usize) void;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn rindex(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn ffs(__i: c_int) c_int;
pub extern fn ffsl(__l: c_long) c_int;
pub extern fn ffsll(__ll: c_longlong) c_int;
pub extern fn strcasecmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncasecmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize) c_int;
pub extern fn strcasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __loc: locale_t) c_int;
pub extern fn strncasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize, __loc: locale_t) c_int;
pub extern fn explicit_bzero(__s: ?*anyopaque, __n: usize) void;
pub extern fn strsep(noalias __stringp: [*c][*c]u8, noalias __delim: [*c]const u8) [*c]u8;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub extern fn __stpcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn stpcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn __stpncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn stpncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strlcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) usize;
pub extern fn strlcat(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) usize;
pub const struct__keymap_entry = extern struct {
    type: u8 = 0,
    function: ?*const rl_command_func_t = null,
    pub const rl_copy_keymap = __root.rl_copy_keymap;
    pub const rl_discard_keymap = __root.rl_discard_keymap;
    pub const rl_set_keymap = __root.rl_set_keymap;
    pub const rl_empty_keymap = __root.rl_empty_keymap;
    pub const rl_free_keymap = __root.rl_free_keymap;
    pub const rl_get_keymap_name = __root.rl_get_keymap_name;
    pub const rl_tty_set_default_bindings = __root.rl_tty_set_default_bindings;
    pub const rl_tty_unset_default_bindings = __root.rl_tty_unset_default_bindings;
    pub const keymap = __root.rl_copy_keymap;
    pub const name = __root.rl_get_keymap_name;
    pub const bindings = __root.rl_tty_set_default_bindings;
};
pub const KEYMAP_ENTRY = struct__keymap_entry;
pub const KEYMAP_ENTRY_ARRAY = [257]KEYMAP_ENTRY;
pub const Keymap = [*c]KEYMAP_ENTRY;
pub extern var emacs_standard_keymap: KEYMAP_ENTRY_ARRAY;
pub extern var emacs_meta_keymap: KEYMAP_ENTRY_ARRAY;
pub extern var emacs_ctlx_keymap: KEYMAP_ENTRY_ARRAY;
pub extern var vi_insertion_keymap: KEYMAP_ENTRY_ARRAY;
pub extern var vi_movement_keymap: KEYMAP_ENTRY_ARRAY;
pub extern fn rl_make_bare_keymap() Keymap;
pub extern fn rl_copy_keymap(Keymap) Keymap;
pub extern fn rl_make_keymap() Keymap;
pub extern fn rl_discard_keymap(Keymap) void;
pub extern fn rl_get_keymap_by_name([*c]const u8) Keymap;
pub extern fn rl_get_keymap() Keymap;
pub extern fn rl_set_keymap(Keymap) void;
pub extern fn rl_set_keymap_name([*c]const u8, Keymap) c_int;
pub const tilde_hook_func_t = fn ([*c]u8) callconv(.c) [*c]u8;
pub extern var tilde_expansion_preexpansion_hook: ?*const tilde_hook_func_t;
pub extern var tilde_expansion_failure_hook: ?*const tilde_hook_func_t;
pub extern var tilde_additional_prefixes: [*c][*c]u8;
pub extern var tilde_additional_suffixes: [*c][*c]u8;
pub extern fn tilde_expand([*c]const u8) [*c]u8;
pub extern fn tilde_expand_word([*c]const u8) [*c]u8;
pub extern fn tilde_find_word([*c]const u8, c_int, [*c]c_int) [*c]u8;
pub const UNDO_DELETE: c_int = 0;
pub const UNDO_INSERT: c_int = 1;
pub const UNDO_BEGIN: c_int = 2;
pub const UNDO_END: c_int = 3;
pub const enum_undo_code = c_uint;
pub const struct_undo_list = extern struct {
    next: [*c]struct_undo_list = null,
    start: c_int = 0,
    end: c_int = 0,
    text: [*c]u8 = null,
    what: enum_undo_code = @import("std").mem.zeroes(enum_undo_code),
};
pub const UNDO_LIST = struct_undo_list;
pub extern var rl_undo_list: [*c]UNDO_LIST;
pub const struct__funmap = extern struct {
    name: [*c]const u8 = null,
    function: ?*const rl_command_func_t = null,
};
pub const FUNMAP = struct__funmap;
pub extern var funmap: [*c][*c]FUNMAP;
pub extern fn rl_digit_argument(c_int, c_int) c_int;
pub extern fn rl_universal_argument(c_int, c_int) c_int;
pub extern fn rl_forward_byte(c_int, c_int) c_int;
pub extern fn rl_forward_char(c_int, c_int) c_int;
pub extern fn rl_forward(c_int, c_int) c_int;
pub extern fn rl_backward_byte(c_int, c_int) c_int;
pub extern fn rl_backward_char(c_int, c_int) c_int;
pub extern fn rl_backward(c_int, c_int) c_int;
pub extern fn rl_beg_of_line(c_int, c_int) c_int;
pub extern fn rl_end_of_line(c_int, c_int) c_int;
pub extern fn rl_forward_word(c_int, c_int) c_int;
pub extern fn rl_backward_word(c_int, c_int) c_int;
pub extern fn rl_refresh_line(c_int, c_int) c_int;
pub extern fn rl_clear_screen(c_int, c_int) c_int;
pub extern fn rl_clear_display(c_int, c_int) c_int;
pub extern fn rl_skip_csi_sequence(c_int, c_int) c_int;
pub extern fn rl_arrow_keys(c_int, c_int) c_int;
pub extern fn rl_previous_screen_line(c_int, c_int) c_int;
pub extern fn rl_next_screen_line(c_int, c_int) c_int;
pub extern fn rl_insert(c_int, c_int) c_int;
pub extern fn rl_quoted_insert(c_int, c_int) c_int;
pub extern fn rl_tab_insert(c_int, c_int) c_int;
pub extern fn rl_newline(c_int, c_int) c_int;
pub extern fn rl_do_lowercase_version(c_int, c_int) c_int;
pub extern fn rl_rubout(c_int, c_int) c_int;
pub extern fn rl_delete(c_int, c_int) c_int;
pub extern fn rl_rubout_or_delete(c_int, c_int) c_int;
pub extern fn rl_delete_horizontal_space(c_int, c_int) c_int;
pub extern fn rl_delete_or_show_completions(c_int, c_int) c_int;
pub extern fn rl_insert_comment(c_int, c_int) c_int;
pub extern fn rl_upcase_word(c_int, c_int) c_int;
pub extern fn rl_downcase_word(c_int, c_int) c_int;
pub extern fn rl_capitalize_word(c_int, c_int) c_int;
pub extern fn rl_transpose_words(c_int, c_int) c_int;
pub extern fn rl_transpose_chars(c_int, c_int) c_int;
pub extern fn rl_char_search(c_int, c_int) c_int;
pub extern fn rl_backward_char_search(c_int, c_int) c_int;
pub extern fn rl_beginning_of_history(c_int, c_int) c_int;
pub extern fn rl_end_of_history(c_int, c_int) c_int;
pub extern fn rl_get_next_history(c_int, c_int) c_int;
pub extern fn rl_get_previous_history(c_int, c_int) c_int;
pub extern fn rl_operate_and_get_next(c_int, c_int) c_int;
pub extern fn rl_fetch_history(c_int, c_int) c_int;
pub extern fn rl_set_mark(c_int, c_int) c_int;
pub extern fn rl_exchange_point_and_mark(c_int, c_int) c_int;
pub extern fn rl_vi_editing_mode(c_int, c_int) c_int;
pub extern fn rl_emacs_editing_mode(c_int, c_int) c_int;
pub extern fn rl_overwrite_mode(c_int, c_int) c_int;
pub extern fn rl_re_read_init_file(c_int, c_int) c_int;
pub extern fn rl_dump_functions(c_int, c_int) c_int;
pub extern fn rl_dump_macros(c_int, c_int) c_int;
pub extern fn rl_dump_variables(c_int, c_int) c_int;
pub extern fn rl_complete(c_int, c_int) c_int;
pub extern fn rl_possible_completions(c_int, c_int) c_int;
pub extern fn rl_insert_completions(c_int, c_int) c_int;
pub extern fn rl_old_menu_complete(c_int, c_int) c_int;
pub extern fn rl_menu_complete(c_int, c_int) c_int;
pub extern fn rl_backward_menu_complete(c_int, c_int) c_int;
pub extern fn rl_export_completions(c_int, c_int) c_int;
pub extern fn rl_kill_word(c_int, c_int) c_int;
pub extern fn rl_backward_kill_word(c_int, c_int) c_int;
pub extern fn rl_kill_line(c_int, c_int) c_int;
pub extern fn rl_backward_kill_line(c_int, c_int) c_int;
pub extern fn rl_kill_full_line(c_int, c_int) c_int;
pub extern fn rl_unix_word_rubout(c_int, c_int) c_int;
pub extern fn rl_unix_filename_rubout(c_int, c_int) c_int;
pub extern fn rl_unix_line_discard(c_int, c_int) c_int;
pub extern fn rl_copy_region_to_kill(c_int, c_int) c_int;
pub extern fn rl_kill_region(c_int, c_int) c_int;
pub extern fn rl_copy_forward_word(c_int, c_int) c_int;
pub extern fn rl_copy_backward_word(c_int, c_int) c_int;
pub extern fn rl_yank(c_int, c_int) c_int;
pub extern fn rl_yank_pop(c_int, c_int) c_int;
pub extern fn rl_yank_nth_arg(c_int, c_int) c_int;
pub extern fn rl_yank_last_arg(c_int, c_int) c_int;
pub extern fn rl_bracketed_paste_begin(c_int, c_int) c_int;
pub extern fn rl_reverse_search_history(c_int, c_int) c_int;
pub extern fn rl_forward_search_history(c_int, c_int) c_int;
pub extern fn rl_start_kbd_macro(c_int, c_int) c_int;
pub extern fn rl_end_kbd_macro(c_int, c_int) c_int;
pub extern fn rl_call_last_kbd_macro(c_int, c_int) c_int;
pub extern fn rl_print_last_kbd_macro(c_int, c_int) c_int;
pub extern fn rl_revert_line(c_int, c_int) c_int;
pub extern fn rl_undo_command(c_int, c_int) c_int;
pub extern fn rl_tilde_expand(c_int, c_int) c_int;
pub extern fn rl_restart_output(c_int, c_int) c_int;
pub extern fn rl_stop_output(c_int, c_int) c_int;
pub extern fn rl_abort(c_int, c_int) c_int;
pub extern fn rl_tty_status(c_int, c_int) c_int;
pub extern fn rl_execute_named_command(c_int, c_int) c_int;
pub extern fn rl_history_search_forward(c_int, c_int) c_int;
pub extern fn rl_history_search_backward(c_int, c_int) c_int;
pub extern fn rl_history_substr_search_forward(c_int, c_int) c_int;
pub extern fn rl_history_substr_search_backward(c_int, c_int) c_int;
pub extern fn rl_noninc_forward_search(c_int, c_int) c_int;
pub extern fn rl_noninc_reverse_search(c_int, c_int) c_int;
pub extern fn rl_noninc_forward_search_again(c_int, c_int) c_int;
pub extern fn rl_noninc_reverse_search_again(c_int, c_int) c_int;
pub extern fn rl_insert_close(c_int, c_int) c_int;
pub extern fn rl_callback_handler_install([*c]const u8, ?*const rl_vcpfunc_t) void;
pub extern fn rl_callback_read_char() void;
pub extern fn rl_callback_handler_remove() void;
pub extern fn rl_callback_sigcleanup() void;
pub extern fn rl_vi_redo(c_int, c_int) c_int;
pub extern fn rl_vi_undo(c_int, c_int) c_int;
pub extern fn rl_vi_yank_arg(c_int, c_int) c_int;
pub extern fn rl_vi_fetch_history(c_int, c_int) c_int;
pub extern fn rl_vi_search_again(c_int, c_int) c_int;
pub extern fn rl_vi_search(c_int, c_int) c_int;
pub extern fn rl_vi_complete(c_int, c_int) c_int;
pub extern fn rl_vi_tilde_expand(c_int, c_int) c_int;
pub extern fn rl_vi_prev_word(c_int, c_int) c_int;
pub extern fn rl_vi_next_word(c_int, c_int) c_int;
pub extern fn rl_vi_end_word(c_int, c_int) c_int;
pub extern fn rl_vi_insert_beg(c_int, c_int) c_int;
pub extern fn rl_vi_append_mode(c_int, c_int) c_int;
pub extern fn rl_vi_append_eol(c_int, c_int) c_int;
pub extern fn rl_vi_eof_maybe(c_int, c_int) c_int;
pub extern fn rl_vi_insertion_mode(c_int, c_int) c_int;
pub extern fn rl_vi_insert_mode(c_int, c_int) c_int;
pub extern fn rl_vi_movement_mode(c_int, c_int) c_int;
pub extern fn rl_vi_arg_digit(c_int, c_int) c_int;
pub extern fn rl_vi_change_case(c_int, c_int) c_int;
pub extern fn rl_vi_put(c_int, c_int) c_int;
pub extern fn rl_vi_column(c_int, c_int) c_int;
pub extern fn rl_vi_delete_to(c_int, c_int) c_int;
pub extern fn rl_vi_change_to(c_int, c_int) c_int;
pub extern fn rl_vi_yank_to(c_int, c_int) c_int;
pub extern fn rl_vi_yank_pop(c_int, c_int) c_int;
pub extern fn rl_vi_rubout(c_int, c_int) c_int;
pub extern fn rl_vi_delete(c_int, c_int) c_int;
pub extern fn rl_vi_back_to_indent(c_int, c_int) c_int;
pub extern fn rl_vi_unix_word_rubout(c_int, c_int) c_int;
pub extern fn rl_vi_first_print(c_int, c_int) c_int;
pub extern fn rl_vi_char_search(c_int, c_int) c_int;
pub extern fn rl_vi_match(c_int, c_int) c_int;
pub extern fn rl_vi_change_char(c_int, c_int) c_int;
pub extern fn rl_vi_subst(c_int, c_int) c_int;
pub extern fn rl_vi_overstrike(c_int, c_int) c_int;
pub extern fn rl_vi_overstrike_delete(c_int, c_int) c_int;
pub extern fn rl_vi_replace(c_int, c_int) c_int;
pub extern fn rl_vi_set_mark(c_int, c_int) c_int;
pub extern fn rl_vi_goto_mark(c_int, c_int) c_int;
pub extern fn rl_vi_check() c_int;
pub extern fn rl_vi_domove(c_int, [*c]c_int) c_int;
pub extern fn rl_vi_bracktype(c_int) c_int;
pub extern fn rl_vi_start_inserting(c_int, c_int, c_int) void;
pub extern fn rl_vi_fWord(c_int, c_int) c_int;
pub extern fn rl_vi_bWord(c_int, c_int) c_int;
pub extern fn rl_vi_eWord(c_int, c_int) c_int;
pub extern fn rl_vi_fword(c_int, c_int) c_int;
pub extern fn rl_vi_bword(c_int, c_int) c_int;
pub extern fn rl_vi_eword(c_int, c_int) c_int;
pub extern fn readline([*c]const u8) [*c]u8;
pub extern fn rl_set_prompt([*c]const u8) c_int;
pub extern fn rl_expand_prompt([*c]u8) c_int;
pub extern fn rl_initialize() c_int;
pub extern fn rl_discard_argument() c_int;
pub extern fn rl_add_defun([*c]const u8, ?*const rl_command_func_t, c_int) c_int;
pub extern fn rl_bind_key(c_int, ?*const rl_command_func_t) c_int;
pub extern fn rl_bind_key_in_map(c_int, ?*const rl_command_func_t, Keymap) c_int;
pub extern fn rl_unbind_key(c_int) c_int;
pub extern fn rl_unbind_key_in_map(c_int, Keymap) c_int;
pub extern fn rl_bind_key_if_unbound(c_int, ?*const rl_command_func_t) c_int;
pub extern fn rl_bind_key_if_unbound_in_map(c_int, ?*const rl_command_func_t, Keymap) c_int;
pub extern fn rl_unbind_function_in_map(?*const rl_command_func_t, Keymap) c_int;
pub extern fn rl_unbind_command_in_map([*c]const u8, Keymap) c_int;
pub extern fn rl_bind_keyseq([*c]const u8, ?*const rl_command_func_t) c_int;
pub extern fn rl_bind_keyseq_in_map([*c]const u8, ?*const rl_command_func_t, Keymap) c_int;
pub extern fn rl_bind_keyseq_if_unbound([*c]const u8, ?*const rl_command_func_t) c_int;
pub extern fn rl_bind_keyseq_if_unbound_in_map([*c]const u8, ?*const rl_command_func_t, Keymap) c_int;
pub extern fn rl_generic_bind(c_int, [*c]const u8, [*c]u8, Keymap) c_int;
pub extern fn rl_variable_value([*c]const u8) [*c]u8;
pub extern fn rl_variable_bind([*c]const u8, [*c]const u8) c_int;
pub extern fn rl_set_key([*c]const u8, ?*const rl_command_func_t, Keymap) c_int;
pub extern fn rl_macro_bind([*c]const u8, [*c]const u8, Keymap) c_int;
pub extern fn rl_translate_keyseq([*c]const u8, [*c]u8, [*c]c_int) c_int;
pub extern fn rl_untranslate_keyseq(c_int) [*c]u8;
pub extern fn rl_named_function([*c]const u8) ?*const rl_command_func_t;
pub extern fn rl_function_of_keyseq([*c]const u8, Keymap, [*c]c_int) ?*const rl_command_func_t;
pub extern fn rl_function_of_keyseq_len([*c]const u8, usize, Keymap, [*c]c_int) ?*const rl_command_func_t;
pub extern fn rl_trim_arg_from_keyseq([*c]const u8, usize, Keymap) c_int;
pub extern fn rl_list_funmap_names() void;
pub extern fn rl_invoking_keyseqs_in_map(?*const rl_command_func_t, Keymap) [*c][*c]u8;
pub extern fn rl_invoking_keyseqs(?*const rl_command_func_t) [*c][*c]u8;
pub extern fn rl_print_keybinding([*c]const u8, Keymap, c_int) void;
pub extern fn rl_function_dumper(c_int) void;
pub extern fn rl_macro_dumper(c_int) void;
pub extern fn rl_variable_dumper(c_int) void;
pub extern fn rl_read_init_file([*c]const u8) c_int;
pub extern fn rl_parse_and_bind([*c]u8) c_int;
pub extern fn rl_empty_keymap(Keymap) c_int;
pub extern fn rl_free_keymap(Keymap) void;
pub extern fn rl_get_keymap_name(Keymap) [*c]u8;
pub extern fn rl_set_keymap_from_edit_mode() void;
pub extern fn rl_get_keymap_name_from_edit_mode() [*c]u8;
pub extern fn rl_add_funmap_entry([*c]const u8, ?*const rl_command_func_t) c_int;
pub extern fn rl_funmap_names() [*c][*c]const u8;
pub extern fn rl_initialize_funmap() void;
pub extern fn rl_push_macro_input([*c]u8) void;
pub extern fn rl_add_undo(enum_undo_code, c_int, c_int, [*c]u8) void;
pub extern fn rl_free_undo_list() void;
pub extern fn rl_do_undo() c_int;
pub extern fn rl_begin_undo_group() c_int;
pub extern fn rl_end_undo_group() c_int;
pub extern fn rl_modifying(c_int, c_int) c_int;
pub extern fn rl_redisplay() void;
pub extern fn rl_on_new_line() c_int;
pub extern fn rl_on_new_line_with_prompt() c_int;
pub extern fn rl_forced_update_display() c_int;
pub extern fn rl_clear_visible_line() c_int;
pub extern fn rl_clear_message() c_int;
pub extern fn rl_reset_line_state() c_int;
pub extern fn rl_crlf() c_int;
pub extern fn rl_keep_mark_active() void;
pub extern fn rl_activate_mark() void;
pub extern fn rl_deactivate_mark() void;
pub extern fn rl_mark_active_p() c_int;
pub extern fn rl_message([*c]const u8, ...) c_int;
pub extern fn rl_show_char(c_int) c_int;
pub extern fn rl_character_len(c_int, c_int) c_int;
pub extern fn rl_redraw_prompt_last_line() void;
pub extern fn rl_save_prompt() void;
pub extern fn rl_restore_prompt() void;
pub extern fn rl_replace_line([*c]const u8, c_int) void;
pub extern fn rl_insert_text([*c]const u8) c_int;
pub extern fn rl_delete_text(c_int, c_int) c_int;
pub extern fn rl_kill_text(c_int, c_int) c_int;
pub extern fn rl_copy_text(c_int, c_int) [*c]u8;
pub extern fn rl_prep_terminal(c_int) void;
pub extern fn rl_deprep_terminal() void;
pub extern fn rl_tty_set_default_bindings(Keymap) void;
pub extern fn rl_tty_unset_default_bindings(Keymap) void;
pub extern fn rl_tty_set_echoing(c_int) c_int;
pub extern fn rl_reset_terminal([*c]const u8) c_int;
pub extern fn rl_resize_terminal() void;
pub extern fn rl_set_screen_size(c_int, c_int) void;
pub extern fn rl_get_screen_size([*c]c_int, [*c]c_int) void;
pub extern fn rl_reset_screen_size() void;
pub extern fn rl_get_termcap([*c]const u8) [*c]u8;
pub extern fn rl_reparse_colors() void;
pub extern fn rl_stuff_char(c_int) c_int;
pub extern fn rl_execute_next(c_int) c_int;
pub extern fn rl_clear_pending_input() c_int;
pub extern fn rl_read_key() c_int;
pub extern fn rl_getc(?*FILE) c_int;
pub extern fn rl_set_keyboard_input_timeout(c_int) c_int;
pub extern fn rl_set_timeout(c_uint, c_uint) c_int;
pub extern fn rl_timeout_remaining([*c]c_uint, [*c]c_uint) c_int;
pub extern fn rl_extend_line_buffer(c_int) void;
pub extern fn rl_ding() c_int;
pub extern fn rl_alphabetic(c_int) c_int;
pub extern fn rl_free(?*anyopaque) void;
pub extern fn rl_set_signals() c_int;
pub extern fn rl_clear_signals() c_int;
pub extern fn rl_cleanup_after_signal() void;
pub extern fn rl_reset_after_signal() void;
pub extern fn rl_free_line_state() void;
pub extern fn rl_pending_signal() c_int;
pub extern fn rl_check_signals() void;
pub extern fn rl_echo_signal_char(c_int) void;
pub extern fn rl_set_paren_blink_timeout(c_int) c_int;
pub extern fn rl_clear_history() void;
pub extern fn rl_maybe_save_line() c_int;
pub extern fn rl_maybe_unsave_line() c_int;
pub extern fn rl_maybe_replace_line() c_int;
pub extern fn rl_complete_internal(c_int) c_int;
pub extern fn rl_display_match_list([*c][*c]u8, c_int, c_int) void;
pub extern fn rl_completion_matches([*c]const u8, ?*const rl_compentry_func_t) [*c][*c]u8;
pub extern fn rl_username_completion_function([*c]const u8, c_int) [*c]u8;
pub extern fn rl_filename_completion_function([*c]const u8, c_int) [*c]u8;
pub extern fn rl_completion_mode(?*const rl_command_func_t) c_int;
pub extern var rl_library_version: [*c]const u8;
pub extern var rl_readline_version: c_int;
pub extern var rl_gnu_readline_p: c_int;
pub extern var rl_readline_state: c_ulong;
pub extern var rl_editing_mode: c_int;
pub extern var rl_insert_mode: c_int;
pub extern var rl_readline_name: [*c]const u8;
pub extern var rl_prompt: [*c]u8;
pub extern var rl_display_prompt: [*c]u8;
pub extern var rl_line_buffer: [*c]u8;
pub extern var rl_point: c_int;
pub extern var rl_end: c_int;
pub extern var rl_mark: c_int;
pub extern var rl_done: c_int;
pub extern var rl_eof_found: c_int;
pub extern var rl_pending_input: c_int;
pub extern var rl_dispatching: c_int;
pub extern var rl_explicit_arg: c_int;
pub extern var rl_numeric_arg: c_int;
pub extern var rl_last_func: ?*const rl_command_func_t;
pub extern var rl_terminal_name: [*c]const u8;
pub extern var rl_instream: ?*FILE;
pub extern var rl_outstream: ?*FILE;
pub extern var rl_prefer_env_winsize: c_int;
pub extern var rl_startup_hook: ?*const rl_hook_func_t;
pub extern var rl_pre_input_hook: ?*const rl_hook_func_t;
pub extern var rl_event_hook: ?*const rl_hook_func_t;
pub extern var rl_signal_event_hook: ?*const rl_hook_func_t;
pub extern var rl_timeout_event_hook: ?*const rl_hook_func_t;
pub extern var rl_input_available_hook: ?*const rl_hook_func_t;
pub extern var rl_getc_function: ?*const rl_getc_func_t;
pub extern var rl_redisplay_function: ?*const rl_voidfunc_t;
pub extern var rl_prep_term_function: ?*const rl_vintfunc_t;
pub extern var rl_deprep_term_function: ?*const rl_voidfunc_t;
pub extern var rl_macro_display_hook: ?*const rl_macro_print_func_t;
pub extern var rl_executing_keymap: Keymap;
pub extern var rl_binding_keymap: Keymap;
pub extern var rl_executing_key: c_int;
pub extern var rl_executing_keyseq: [*c]u8;
pub extern var rl_key_sequence_length: c_int;
pub extern var rl_erase_empty_line: c_int;
pub extern var rl_already_prompted: c_int;
pub extern var rl_num_chars_to_read: c_int;
pub extern var rl_executing_macro: [*c]u8;
pub extern var rl_catch_signals: c_int;
pub extern var rl_catch_sigwinch: c_int;
pub extern var rl_change_environment: c_int;
pub extern var rl_completion_entry_function: ?*const rl_compentry_func_t;
pub extern var rl_menu_completion_entry_function: ?*const rl_compentry_func_t;
pub extern var rl_ignore_some_completions_function: ?*const rl_compignore_func_t;
pub extern var rl_attempted_completion_function: ?*const rl_completion_func_t;
pub extern var rl_basic_word_break_characters: [*c]const u8;
pub extern var rl_completer_word_break_characters: [*c]const u8;
pub extern var rl_completion_word_break_hook: ?*const rl_cpvfunc_t;
pub extern var rl_completer_quote_characters: [*c]const u8;
pub extern var rl_basic_quote_characters: [*c]const u8;
pub extern var rl_filename_quote_characters: [*c]const u8;
pub extern var rl_special_prefixes: [*c]const u8;
pub extern var rl_directory_completion_hook: ?*const rl_icppfunc_t;
pub extern var rl_directory_rewrite_hook: ?*const rl_icppfunc_t;
pub extern var rl_filename_stat_hook: ?*const rl_icppfunc_t;
pub extern var rl_filename_rewrite_hook: ?*const rl_dequote_func_t;
pub extern var rl_completion_rewrite_hook: ?*const rl_dequote_func_t;
pub extern var rl_completion_display_matches_hook: ?*const rl_compdisp_func_t;
pub extern var rl_filename_completion_desired: c_int;
pub extern var rl_filename_quoting_desired: c_int;
pub extern var rl_full_quoting_desired: c_int;
pub extern var rl_filename_quoting_function: ?*const rl_quote_func_t;
pub extern var rl_filename_dequoting_function: ?*const rl_dequote_func_t;
pub extern var rl_char_is_quoted_p: ?*const rl_linebuf_func_t;
pub extern var rl_attempted_completion_over: c_int;
pub extern var rl_completion_type: c_int;
pub extern var rl_completion_invoking_key: c_int;
pub extern var rl_completion_query_items: c_int;
pub extern var rl_completion_append_character: c_int;
pub extern var rl_completion_suppress_append: c_int;
pub extern var rl_completion_quote_character: c_int;
pub extern var rl_completion_found_quote: c_int;
pub extern var rl_completion_suppress_quote: c_int;
pub extern var rl_sort_completion_matches: c_int;
pub extern var rl_completion_mark_symlink_dirs: c_int;
pub extern var rl_ignore_completion_duplicates: c_int;
pub extern var rl_inhibit_completion: c_int;
pub extern var rl_persistent_signal_handlers: c_int;
pub const struct_readline_state = extern struct {
    point: c_int = 0,
    end: c_int = 0,
    mark: c_int = 0,
    buflen: c_int = 0,
    buffer: [*c]u8 = null,
    ul: [*c]UNDO_LIST = null,
    prompt: [*c]u8 = null,
    rlstate: c_int = 0,
    done: c_int = 0,
    kmap: Keymap = null,
    lastfunc: ?*const rl_command_func_t = null,
    insmode: c_int = 0,
    edmode: c_int = 0,
    kseq: [*c]u8 = null,
    kseqlen: c_int = 0,
    pendingin: c_int = 0,
    inf: ?*FILE = null,
    outf: ?*FILE = null,
    macro: [*c]u8 = null,
    catchsigs: c_int = 0,
    catchsigwinch: c_int = 0,
    entryfunc: ?*const rl_compentry_func_t = null,
    menuentryfunc: ?*const rl_compentry_func_t = null,
    ignorefunc: ?*const rl_compignore_func_t = null,
    attemptfunc: ?*const rl_completion_func_t = null,
    wordbreakchars: [*c]const u8 = null,
    reserved: [64]u8 = @import("std").mem.zeroes([64]u8),
    pub const rl_save_state = __root.rl_save_state;
    pub const rl_restore_state = __root.rl_restore_state;
    pub const state = __root.rl_save_state;
};
pub extern fn rl_save_state([*c]struct_readline_state) c_int;
pub extern fn rl_restore_state([*c]struct_readline_state) c_int;

pub const __VERSION__ = "Aro aro-zig";
pub const __Aro__ = "";
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __GNUC__ = @as(c_int, 7);
pub const __GNUC_MINOR__ = @as(c_int, 1);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 0);
pub const __ARO_EMULATE_NO__ = @as(c_int, 0);
pub const __ARO_EMULATE_CLANG__ = @as(c_int, 1);
pub const __ARO_EMULATE_GCC__ = @as(c_int, 2);
pub const __ARO_EMULATE_MSVC__ = @as(c_int, 3);
pub const __ARO_EMULATE__ = __ARO_EMULATE_GCC__;
pub inline fn __building_module(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`"); // <builtin>:33:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`"); // <builtin>:34:9
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MWAITX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __ELF__ = @as(c_int, 1);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __ATOMIC_BOOL_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WINT_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_SHORT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_INT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_POINTER_LOCK_FREE = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SCHAR_WIDTH__ = @as(c_int, 8);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __LONG_LONG_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIG_ATOMIC_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __BITINT_MAXWIDTH__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 10);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTPTR_TYPE__ = c_long;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // <builtin>:152:9
pub const __INTMAX_C = __helpers.L_SUFFIX;
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // <builtin>:155:9
pub const __UINTMAX_C = __helpers.UL_SUFFIX;
pub const __PTRDIFF_TYPE__ = c_long;
pub const __SIZE_TYPE__ = c_ulong;
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub inline fn __INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub inline fn __INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub inline fn __INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // <builtin>:181:9
pub const __INT64_C = __helpers.L_SUFFIX;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub inline fn __UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub inline fn __UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // <builtin>:206:9
pub const __UINT32_C = __helpers.U_SUFFIX;
pub const __UINT32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // <builtin>:215:9
pub const __UINT64_C = __helpers.UL_SUFFIX;
pub const __UINT64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const INT_LEAST8_FMTd__ = "hhd";
pub const INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const UINT_LEAST8_FMTo__ = "hho";
pub const UINT_LEAST8_FMTu__ = "hhu";
pub const UINT_LEAST8_FMTx__ = "hhx";
pub const UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const INT_FAST8_FMTd__ = "hhd";
pub const INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const UINT_FAST8_FMTo__ = "hho";
pub const UINT_FAST8_FMTu__ = "hhu";
pub const UINT_FAST8_FMTx__ = "hhx";
pub const UINT_FAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const INT_LEAST16_FMTd__ = "hd";
pub const INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST16_FMTo__ = "ho";
pub const UINT_LEAST16_FMTu__ = "hu";
pub const UINT_LEAST16_FMTx__ = "hx";
pub const UINT_LEAST16_FMTX__ = "hX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const INT_FAST16_FMTd__ = "hd";
pub const INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_FAST16_FMTo__ = "ho";
pub const UINT_FAST16_FMTu__ = "hu";
pub const UINT_FAST16_FMTx__ = "hx";
pub const UINT_FAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const INT_LEAST32_FMTd__ = "d";
pub const INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST32_FMTo__ = "o";
pub const UINT_LEAST32_FMTu__ = "u";
pub const UINT_LEAST32_FMTx__ = "x";
pub const UINT_LEAST32_FMTX__ = "X";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const INT_FAST32_FMTd__ = "d";
pub const INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_FAST32_FMTo__ = "o";
pub const UINT_FAST32_FMTu__ = "u";
pub const UINT_FAST32_FMTx__ = "x";
pub const UINT_FAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const INT_LEAST64_FMTd__ = "ld";
pub const INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_LEAST64_FMTo__ = "lo";
pub const UINT_LEAST64_FMTu__ = "lu";
pub const UINT_LEAST64_FMTx__ = "lx";
pub const UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const INT_FAST64_FMTd__ = "ld";
pub const INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_FMTo__ = "lo";
pub const UINT_FAST64_FMTu__ = "lu";
pub const UINT_FAST64_FMTx__ = "lx";
pub const UINT_FAST64_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = "";
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = "";
pub const __FLT16_HAS_QUIET_NAN__ = "";
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = "";
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = "";
pub const __FLT_HAS_QUIET_NAN__ = "";
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = "";
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = "";
pub const __DBL_HAS_QUIET_NAN__ = "";
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = "";
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = "";
pub const __LDBL_HAS_QUIET_NAN__ = "";
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const _STDIO_H = @as(c_int, 1);
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &maj;
    _ = &min;
    return @as(c_int, 0);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`"); // /usr/include//features.h:191:9
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2Y = @as(c_int, 0);
pub const __GLIBC_USE_ISOC23 = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_TIME_BITS64 = @as(c_int, 1);
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C23_STRTOL = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub const __GLIBC_MINOR__ = @as(c_int, 42);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`"); // /usr/include//sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__builtin.has_builtin(name)) {
    _ = &name;
    return __builtin.has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`"); // /usr/include//sys/cdefs.h:55:10
pub const __LEAF = @compileError("unable to translate macro: undefined identifier `__leaf__`"); // /usr/include//sys/cdefs.h:65:11
pub const __LEAF_ATTR = @compileError("unable to translate macro: undefined identifier `__leaf__`"); // /usr/include//sys/cdefs.h:66:11
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /usr/include//sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /usr/include//sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /usr/include//sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /usr/include//sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`"); // /usr/include//sys/cdefs.h:102:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'"); // /usr/include//sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token ''"); // /usr/include//sys/cdefs.h:132:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub const __attribute_overloadable__ = "";
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin.object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin.object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin.object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin.object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub const __warnattr = @compileError("unable to translate macro: undefined identifier `__warning__`"); // /usr/include//sys/cdefs.h:366:10
pub const __errordecl = @compileError("unable to translate macro: undefined identifier `__error__`"); // /usr/include//sys/cdefs.h:367:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['"); // /usr/include//sys/cdefs.h:379:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /usr/include//sys/cdefs.h:410:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /usr/include//sys/cdefs.h:417:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /usr/include//sys/cdefs.h:419:11
pub const __ASMNAME = @compileError("unable to translate macro: undefined identifier `__USER_LABEL_PREFIX__`"); // /usr/include//sys/cdefs.h:422:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`"); // /usr/include//sys/cdefs.h:452:10
pub const __attribute_alloc_size__ = @compileError("unable to translate macro: undefined identifier `__alloc_size__`"); // /usr/include//sys/cdefs.h:460:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`"); // /usr/include//sys/cdefs.h:469:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`"); // /usr/include//sys/cdefs.h:479:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'"); // /usr/include//sys/cdefs.h:486:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`"); // /usr/include//sys/cdefs.h:492:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`"); // /usr/include//sys/cdefs.h:501:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`"); // /usr/include//sys/cdefs.h:502:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // /usr/include//sys/cdefs.h:510:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // /usr/include//sys/cdefs.h:520:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`"); // /usr/include//sys/cdefs.h:533:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`"); // /usr/include//sys/cdefs.h:543:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`"); // /usr/include//sys/cdefs.h:555:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`"); // /usr/include//sys/cdefs.h:568:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`"); // /usr/include//sys/cdefs.h:577:10
pub const __wur = "";
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`"); // /usr/include//sys/cdefs.h:595:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`"); // /usr/include//sys/cdefs.h:604:10
pub const __extern_inline = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include//sys/cdefs.h:626:11
pub const __extern_always_inline = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include//sys/cdefs.h:627:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __va_arg_pack = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg_pack`"); // /usr/include//sys/cdefs.h:638:10
pub const __va_arg_pack_len = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg_pack_len`"); // /usr/include//sys/cdefs.h:639:10
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'"); // /usr/include//sys/cdefs.h:666:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin.expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin.expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin.expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin.expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub inline fn __attribute_copy__(arg: anytype) void {
    _ = &arg;
    return;
}
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR2_DECL(name: anytype) void {
    _ = &name;
    return;
}
pub inline fn __LDBL_REDIR_DECL(name: anytype) void {
    _ = &name;
    return;
}
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /usr/include//sys/cdefs.h:807:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`"); // /usr/include//sys/cdefs.h:808:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub inline fn __fortified_attr_access(a: anytype, o: anytype, s: anytype) void {
    _ = &a;
    _ = &o;
    _ = &s;
    return;
}
pub inline fn __attr_access(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __attr_access_none(argno: anytype) void {
    _ = &argno;
    return;
}
pub inline fn __attr_dealloc(dealloc: anytype, argno: anytype) void {
    _ = &dealloc;
    _ = &argno;
    return;
}
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`"); // /usr/include//sys/cdefs.h:872:10
pub const __attribute_struct_may_alias__ = @compileError("unable to translate macro: undefined identifier `__may_alias__`"); // /usr/include//sys/cdefs.h:881:10
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const __need_size_t = "";
pub const __need_NULL = "";
pub const __STDC_VERSION_STDDEF_H__ = @as(c_long, 202311);
pub const NULL = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`"); // /opt/zig-bin-0.16.0/lib/compiler/aro/include/stddef.h:18:9
pub const __need___va_list = "";
pub const __STDC_VERSION_STDARG_H__ = @as(c_int, 0);
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // /opt/zig-bin-0.16.0/lib/compiler/aro/include/stdarg.h:12:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // /opt/zig-bin-0.16.0/lib/compiler/aro/include/stdarg.h:14:9
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`"); // /opt/zig-bin-0.16.0/lib/compiler/aro/include/stdarg.h:15:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /opt/zig-bin-0.16.0/lib/compiler/aro/include/stdarg.h:18:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /opt/zig-bin-0.16.0/lib/compiler/aro/include/stdarg.h:22:9
pub const __GNUC_VA_LIST = @as(c_int, 1);
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`"); // /usr/include//bits/typesizes.h:73:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const _____fpos_t_defined = @as(c_int, 1);
pub const ____mbstate_t_defined = @as(c_int, 1);
pub const _____fpos64_t_defined = @as(c_int, 1);
pub const ____FILE_defined = @as(c_int, 1);
pub const __FILE_defined = @as(c_int, 1);
pub const __struct_FILE_defined = @as(c_int, 1);
pub const __getc_unlocked_body = @compileError("TODO postfix inc/dec expr"); // /usr/include//bits/types/struct_FILE.h:113:9
pub const __putc_unlocked_body = @compileError("TODO postfix inc/dec expr"); // /usr/include//bits/types/struct_FILE.h:117:9
pub const _IO_EOF_SEEN = @as(c_int, 0x0010);
pub inline fn __feof_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0);
}
pub const _IO_ERR_SEEN = @as(c_int, 0x0020);
pub inline fn __ferror_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0);
}
pub const _IO_USER_LOCK = __helpers.promoteIntLiteral(c_int, 0x8000, .hex);
pub const __cookie_io_functions_t_defined = @as(c_int, 1);
pub const _VA_LIST_DEFINED = "";
pub const __off_t_defined = "";
pub const __ssize_t_defined = "";
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 8192);
pub const EOF = -@as(c_int, 1);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const P_tmpdir = "/tmp";
pub const L_tmpnam = @as(c_int, 20);
pub const TMP_MAX = __helpers.promoteIntLiteral(c_int, 238328, .decimal);
pub const _BITS_STDIO_LIM_H = @as(c_int, 1);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const L_ctermid = @as(c_int, 9);
pub const FOPEN_MAX = @as(c_int, 16);
pub const __attr_dealloc_fclose = __attr_dealloc(fclose, @as(c_int, 1));
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 1);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 1);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const __f128 = @compileError("unable to translate macro: undefined identifier `f128`"); // /usr/include//bits/floatn.h:72:12
pub const __CFLOAT128 = @compileError("unable to translate: invalid numeric type"); // /usr/include//bits/floatn.h:86:12
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 1);
pub const __f32 = @compileError("unable to translate macro: undefined identifier `f32`"); // /usr/include//bits/floatn-common.h:93:12
pub const __f64 = @compileError("unable to translate macro: undefined identifier `f64`"); // /usr/include//bits/floatn-common.h:105:12
pub const __f32x = @compileError("unable to translate macro: undefined identifier `f32x`"); // /usr/include//bits/floatn-common.h:113:12
pub const __f64x = @compileError("unable to translate macro: undefined identifier `f64x`"); // /usr/include//bits/floatn-common.h:125:12
pub const __CFLOAT32 = @compileError("unable to translate: invalid numeric type"); // /usr/include//bits/floatn-common.h:151:12
pub const __CFLOAT64 = @compileError("unable to translate: invalid numeric type"); // /usr/include//bits/floatn-common.h:163:12
pub const __CFLOAT32X = @compileError("unable to translate: invalid numeric type"); // /usr/include//bits/floatn-common.h:171:12
pub const __CFLOAT64X = @compileError("unable to translate: invalid numeric type"); // /usr/include//bits/floatn-common.h:183:12
pub const SQLITE3_H = "";
pub const SQLITE_EXTERN = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include//sqlite3.h:72:10
pub const SQLITE_API = "";
pub const SQLITE_CDECL = "";
pub const SQLITE_APICALL = "";
pub const SQLITE_STDCALL = "";
pub const SQLITE_CALLBACK = "";
pub const SQLITE_SYSAPI = "";
pub const SQLITE_DEPRECATED = "";
pub const SQLITE_EXPERIMENTAL = "";
pub const SQLITE_VERSION = "3.51.3";
pub const SQLITE_VERSION_NUMBER = __helpers.promoteIntLiteral(c_int, 3051003, .decimal);
pub const SQLITE_SOURCE_ID = "2026-03-13 10:38:09 737ae4a34738ffa0c3ff7f9bb18df914dd1cad163f28fd6b6e114a344fe6alt1";
pub const SQLITE_SCM_BRANCH = "branch-3.51";
pub const SQLITE_SCM_TAGS = "release version-3.51.3";
pub const SQLITE_SCM_DATETIME = "2026-03-13T10:38:09.694Z";
pub const SQLITE_OK = @as(c_int, 0);
pub const SQLITE_ERROR = @as(c_int, 1);
pub const SQLITE_INTERNAL = @as(c_int, 2);
pub const SQLITE_PERM = @as(c_int, 3);
pub const SQLITE_ABORT = @as(c_int, 4);
pub const SQLITE_BUSY = @as(c_int, 5);
pub const SQLITE_LOCKED = @as(c_int, 6);
pub const SQLITE_NOMEM = @as(c_int, 7);
pub const SQLITE_READONLY = @as(c_int, 8);
pub const SQLITE_INTERRUPT = @as(c_int, 9);
pub const SQLITE_IOERR = @as(c_int, 10);
pub const SQLITE_CORRUPT = @as(c_int, 11);
pub const SQLITE_NOTFOUND = @as(c_int, 12);
pub const SQLITE_FULL = @as(c_int, 13);
pub const SQLITE_CANTOPEN = @as(c_int, 14);
pub const SQLITE_PROTOCOL = @as(c_int, 15);
pub const SQLITE_EMPTY = @as(c_int, 16);
pub const SQLITE_SCHEMA = @as(c_int, 17);
pub const SQLITE_TOOBIG = @as(c_int, 18);
pub const SQLITE_CONSTRAINT = @as(c_int, 19);
pub const SQLITE_MISMATCH = @as(c_int, 20);
pub const SQLITE_MISUSE = @as(c_int, 21);
pub const SQLITE_NOLFS = @as(c_int, 22);
pub const SQLITE_AUTH = @as(c_int, 23);
pub const SQLITE_FORMAT = @as(c_int, 24);
pub const SQLITE_RANGE = @as(c_int, 25);
pub const SQLITE_NOTADB = @as(c_int, 26);
pub const SQLITE_NOTICE = @as(c_int, 27);
pub const SQLITE_WARNING = @as(c_int, 28);
pub const SQLITE_ROW = @as(c_int, 100);
pub const SQLITE_DONE = @as(c_int, 101);
pub const SQLITE_ERROR_MISSING_COLLSEQ = SQLITE_ERROR | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_ERROR_RETRY = SQLITE_ERROR | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_ERROR_SNAPSHOT = SQLITE_ERROR | (@as(c_int, 3) << @as(c_int, 8));
pub const SQLITE_ERROR_RESERVESIZE = SQLITE_ERROR | (@as(c_int, 4) << @as(c_int, 8));
pub const SQLITE_ERROR_KEY = SQLITE_ERROR | (@as(c_int, 5) << @as(c_int, 8));
pub const SQLITE_ERROR_UNABLE = SQLITE_ERROR | (@as(c_int, 6) << @as(c_int, 8));
pub const SQLITE_IOERR_READ = SQLITE_IOERR | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_IOERR_SHORT_READ = SQLITE_IOERR | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_IOERR_WRITE = SQLITE_IOERR | (@as(c_int, 3) << @as(c_int, 8));
pub const SQLITE_IOERR_FSYNC = SQLITE_IOERR | (@as(c_int, 4) << @as(c_int, 8));
pub const SQLITE_IOERR_DIR_FSYNC = SQLITE_IOERR | (@as(c_int, 5) << @as(c_int, 8));
pub const SQLITE_IOERR_TRUNCATE = SQLITE_IOERR | (@as(c_int, 6) << @as(c_int, 8));
pub const SQLITE_IOERR_FSTAT = SQLITE_IOERR | (@as(c_int, 7) << @as(c_int, 8));
pub const SQLITE_IOERR_UNLOCK = SQLITE_IOERR | (@as(c_int, 8) << @as(c_int, 8));
pub const SQLITE_IOERR_RDLOCK = SQLITE_IOERR | (@as(c_int, 9) << @as(c_int, 8));
pub const SQLITE_IOERR_DELETE = SQLITE_IOERR | (@as(c_int, 10) << @as(c_int, 8));
pub const SQLITE_IOERR_BLOCKED = SQLITE_IOERR | (@as(c_int, 11) << @as(c_int, 8));
pub const SQLITE_IOERR_NOMEM = SQLITE_IOERR | (@as(c_int, 12) << @as(c_int, 8));
pub const SQLITE_IOERR_ACCESS = SQLITE_IOERR | (@as(c_int, 13) << @as(c_int, 8));
pub const SQLITE_IOERR_CHECKRESERVEDLOCK = SQLITE_IOERR | (@as(c_int, 14) << @as(c_int, 8));
pub const SQLITE_IOERR_LOCK = SQLITE_IOERR | (@as(c_int, 15) << @as(c_int, 8));
pub const SQLITE_IOERR_CLOSE = SQLITE_IOERR | (@as(c_int, 16) << @as(c_int, 8));
pub const SQLITE_IOERR_DIR_CLOSE = SQLITE_IOERR | (@as(c_int, 17) << @as(c_int, 8));
pub const SQLITE_IOERR_SHMOPEN = SQLITE_IOERR | (@as(c_int, 18) << @as(c_int, 8));
pub const SQLITE_IOERR_SHMSIZE = SQLITE_IOERR | (@as(c_int, 19) << @as(c_int, 8));
pub const SQLITE_IOERR_SHMLOCK = SQLITE_IOERR | (@as(c_int, 20) << @as(c_int, 8));
pub const SQLITE_IOERR_SHMMAP = SQLITE_IOERR | (@as(c_int, 21) << @as(c_int, 8));
pub const SQLITE_IOERR_SEEK = SQLITE_IOERR | (@as(c_int, 22) << @as(c_int, 8));
pub const SQLITE_IOERR_DELETE_NOENT = SQLITE_IOERR | (@as(c_int, 23) << @as(c_int, 8));
pub const SQLITE_IOERR_MMAP = SQLITE_IOERR | (@as(c_int, 24) << @as(c_int, 8));
pub const SQLITE_IOERR_GETTEMPPATH = SQLITE_IOERR | (@as(c_int, 25) << @as(c_int, 8));
pub const SQLITE_IOERR_CONVPATH = SQLITE_IOERR | (@as(c_int, 26) << @as(c_int, 8));
pub const SQLITE_IOERR_VNODE = SQLITE_IOERR | (@as(c_int, 27) << @as(c_int, 8));
pub const SQLITE_IOERR_AUTH = SQLITE_IOERR | (@as(c_int, 28) << @as(c_int, 8));
pub const SQLITE_IOERR_BEGIN_ATOMIC = SQLITE_IOERR | (@as(c_int, 29) << @as(c_int, 8));
pub const SQLITE_IOERR_COMMIT_ATOMIC = SQLITE_IOERR | (@as(c_int, 30) << @as(c_int, 8));
pub const SQLITE_IOERR_ROLLBACK_ATOMIC = SQLITE_IOERR | (@as(c_int, 31) << @as(c_int, 8));
pub const SQLITE_IOERR_DATA = SQLITE_IOERR | (@as(c_int, 32) << @as(c_int, 8));
pub const SQLITE_IOERR_CORRUPTFS = SQLITE_IOERR | (@as(c_int, 33) << @as(c_int, 8));
pub const SQLITE_IOERR_IN_PAGE = SQLITE_IOERR | (@as(c_int, 34) << @as(c_int, 8));
pub const SQLITE_IOERR_BADKEY = SQLITE_IOERR | (@as(c_int, 35) << @as(c_int, 8));
pub const SQLITE_IOERR_CODEC = SQLITE_IOERR | (@as(c_int, 36) << @as(c_int, 8));
pub const SQLITE_LOCKED_SHAREDCACHE = SQLITE_LOCKED | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_LOCKED_VTAB = SQLITE_LOCKED | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_BUSY_RECOVERY = SQLITE_BUSY | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_BUSY_SNAPSHOT = SQLITE_BUSY | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_BUSY_TIMEOUT = SQLITE_BUSY | (@as(c_int, 3) << @as(c_int, 8));
pub const SQLITE_CANTOPEN_NOTEMPDIR = SQLITE_CANTOPEN | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_CANTOPEN_ISDIR = SQLITE_CANTOPEN | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_CANTOPEN_FULLPATH = SQLITE_CANTOPEN | (@as(c_int, 3) << @as(c_int, 8));
pub const SQLITE_CANTOPEN_CONVPATH = SQLITE_CANTOPEN | (@as(c_int, 4) << @as(c_int, 8));
pub const SQLITE_CANTOPEN_DIRTYWAL = SQLITE_CANTOPEN | (@as(c_int, 5) << @as(c_int, 8));
pub const SQLITE_CANTOPEN_SYMLINK = SQLITE_CANTOPEN | (@as(c_int, 6) << @as(c_int, 8));
pub const SQLITE_CORRUPT_VTAB = SQLITE_CORRUPT | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_CORRUPT_SEQUENCE = SQLITE_CORRUPT | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_CORRUPT_INDEX = SQLITE_CORRUPT | (@as(c_int, 3) << @as(c_int, 8));
pub const SQLITE_READONLY_RECOVERY = SQLITE_READONLY | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_READONLY_CANTLOCK = SQLITE_READONLY | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_READONLY_ROLLBACK = SQLITE_READONLY | (@as(c_int, 3) << @as(c_int, 8));
pub const SQLITE_READONLY_DBMOVED = SQLITE_READONLY | (@as(c_int, 4) << @as(c_int, 8));
pub const SQLITE_READONLY_CANTINIT = SQLITE_READONLY | (@as(c_int, 5) << @as(c_int, 8));
pub const SQLITE_READONLY_DIRECTORY = SQLITE_READONLY | (@as(c_int, 6) << @as(c_int, 8));
pub const SQLITE_ABORT_ROLLBACK = SQLITE_ABORT | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_CHECK = SQLITE_CONSTRAINT | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_COMMITHOOK = SQLITE_CONSTRAINT | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_FOREIGNKEY = SQLITE_CONSTRAINT | (@as(c_int, 3) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_FUNCTION = SQLITE_CONSTRAINT | (@as(c_int, 4) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_NOTNULL = SQLITE_CONSTRAINT | (@as(c_int, 5) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_PRIMARYKEY = SQLITE_CONSTRAINT | (@as(c_int, 6) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_TRIGGER = SQLITE_CONSTRAINT | (@as(c_int, 7) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_UNIQUE = SQLITE_CONSTRAINT | (@as(c_int, 8) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_VTAB = SQLITE_CONSTRAINT | (@as(c_int, 9) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_ROWID = SQLITE_CONSTRAINT | (@as(c_int, 10) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_PINNED = SQLITE_CONSTRAINT | (@as(c_int, 11) << @as(c_int, 8));
pub const SQLITE_CONSTRAINT_DATATYPE = SQLITE_CONSTRAINT | (@as(c_int, 12) << @as(c_int, 8));
pub const SQLITE_NOTICE_RECOVER_WAL = SQLITE_NOTICE | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_NOTICE_RECOVER_ROLLBACK = SQLITE_NOTICE | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_NOTICE_RBU = SQLITE_NOTICE | (@as(c_int, 3) << @as(c_int, 8));
pub const SQLITE_WARNING_AUTOINDEX = SQLITE_WARNING | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_AUTH_USER = SQLITE_AUTH | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_OK_LOAD_PERMANENTLY = SQLITE_OK | (@as(c_int, 1) << @as(c_int, 8));
pub const SQLITE_OK_SYMLINK = SQLITE_OK | (@as(c_int, 2) << @as(c_int, 8));
pub const SQLITE_OPEN_READONLY = @as(c_int, 0x00000001);
pub const SQLITE_OPEN_READWRITE = @as(c_int, 0x00000002);
pub const SQLITE_OPEN_CREATE = @as(c_int, 0x00000004);
pub const SQLITE_OPEN_DELETEONCLOSE = @as(c_int, 0x00000008);
pub const SQLITE_OPEN_EXCLUSIVE = @as(c_int, 0x00000010);
pub const SQLITE_OPEN_AUTOPROXY = @as(c_int, 0x00000020);
pub const SQLITE_OPEN_URI = @as(c_int, 0x00000040);
pub const SQLITE_OPEN_MEMORY = @as(c_int, 0x00000080);
pub const SQLITE_OPEN_MAIN_DB = @as(c_int, 0x00000100);
pub const SQLITE_OPEN_TEMP_DB = @as(c_int, 0x00000200);
pub const SQLITE_OPEN_TRANSIENT_DB = @as(c_int, 0x00000400);
pub const SQLITE_OPEN_MAIN_JOURNAL = @as(c_int, 0x00000800);
pub const SQLITE_OPEN_TEMP_JOURNAL = @as(c_int, 0x00001000);
pub const SQLITE_OPEN_SUBJOURNAL = @as(c_int, 0x00002000);
pub const SQLITE_OPEN_SUPER_JOURNAL = @as(c_int, 0x00004000);
pub const SQLITE_OPEN_NOMUTEX = __helpers.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const SQLITE_OPEN_FULLMUTEX = __helpers.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const SQLITE_OPEN_SHAREDCACHE = __helpers.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const SQLITE_OPEN_PRIVATECACHE = __helpers.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const SQLITE_OPEN_WAL = __helpers.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const SQLITE_OPEN_NOFOLLOW = __helpers.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const SQLITE_OPEN_EXRESCODE = __helpers.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const SQLITE_OPEN_MASTER_JOURNAL = @as(c_int, 0x00004000);
pub const SQLITE_IOCAP_ATOMIC = @as(c_int, 0x00000001);
pub const SQLITE_IOCAP_ATOMIC512 = @as(c_int, 0x00000002);
pub const SQLITE_IOCAP_ATOMIC1K = @as(c_int, 0x00000004);
pub const SQLITE_IOCAP_ATOMIC2K = @as(c_int, 0x00000008);
pub const SQLITE_IOCAP_ATOMIC4K = @as(c_int, 0x00000010);
pub const SQLITE_IOCAP_ATOMIC8K = @as(c_int, 0x00000020);
pub const SQLITE_IOCAP_ATOMIC16K = @as(c_int, 0x00000040);
pub const SQLITE_IOCAP_ATOMIC32K = @as(c_int, 0x00000080);
pub const SQLITE_IOCAP_ATOMIC64K = @as(c_int, 0x00000100);
pub const SQLITE_IOCAP_SAFE_APPEND = @as(c_int, 0x00000200);
pub const SQLITE_IOCAP_SEQUENTIAL = @as(c_int, 0x00000400);
pub const SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN = @as(c_int, 0x00000800);
pub const SQLITE_IOCAP_POWERSAFE_OVERWRITE = @as(c_int, 0x00001000);
pub const SQLITE_IOCAP_IMMUTABLE = @as(c_int, 0x00002000);
pub const SQLITE_IOCAP_BATCH_ATOMIC = @as(c_int, 0x00004000);
pub const SQLITE_IOCAP_SUBPAGE_READ = __helpers.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const SQLITE_LOCK_NONE = @as(c_int, 0);
pub const SQLITE_LOCK_SHARED = @as(c_int, 1);
pub const SQLITE_LOCK_RESERVED = @as(c_int, 2);
pub const SQLITE_LOCK_PENDING = @as(c_int, 3);
pub const SQLITE_LOCK_EXCLUSIVE = @as(c_int, 4);
pub const SQLITE_SYNC_NORMAL = @as(c_int, 0x00002);
pub const SQLITE_SYNC_FULL = @as(c_int, 0x00003);
pub const SQLITE_SYNC_DATAONLY = @as(c_int, 0x00010);
pub const SQLITE_FCNTL_LOCKSTATE = @as(c_int, 1);
pub const SQLITE_FCNTL_GET_LOCKPROXYFILE = @as(c_int, 2);
pub const SQLITE_FCNTL_SET_LOCKPROXYFILE = @as(c_int, 3);
pub const SQLITE_FCNTL_LAST_ERRNO = @as(c_int, 4);
pub const SQLITE_FCNTL_SIZE_HINT = @as(c_int, 5);
pub const SQLITE_FCNTL_CHUNK_SIZE = @as(c_int, 6);
pub const SQLITE_FCNTL_FILE_POINTER = @as(c_int, 7);
pub const SQLITE_FCNTL_SYNC_OMITTED = @as(c_int, 8);
pub const SQLITE_FCNTL_WIN32_AV_RETRY = @as(c_int, 9);
pub const SQLITE_FCNTL_PERSIST_WAL = @as(c_int, 10);
pub const SQLITE_FCNTL_OVERWRITE = @as(c_int, 11);
pub const SQLITE_FCNTL_VFSNAME = @as(c_int, 12);
pub const SQLITE_FCNTL_POWERSAFE_OVERWRITE = @as(c_int, 13);
pub const SQLITE_FCNTL_PRAGMA = @as(c_int, 14);
pub const SQLITE_FCNTL_BUSYHANDLER = @as(c_int, 15);
pub const SQLITE_FCNTL_TEMPFILENAME = @as(c_int, 16);
pub const SQLITE_FCNTL_MMAP_SIZE = @as(c_int, 18);
pub const SQLITE_FCNTL_TRACE = @as(c_int, 19);
pub const SQLITE_FCNTL_HAS_MOVED = @as(c_int, 20);
pub const SQLITE_FCNTL_SYNC = @as(c_int, 21);
pub const SQLITE_FCNTL_COMMIT_PHASETWO = @as(c_int, 22);
pub const SQLITE_FCNTL_WIN32_SET_HANDLE = @as(c_int, 23);
pub const SQLITE_FCNTL_WAL_BLOCK = @as(c_int, 24);
pub const SQLITE_FCNTL_ZIPVFS = @as(c_int, 25);
pub const SQLITE_FCNTL_RBU = @as(c_int, 26);
pub const SQLITE_FCNTL_VFS_POINTER = @as(c_int, 27);
pub const SQLITE_FCNTL_JOURNAL_POINTER = @as(c_int, 28);
pub const SQLITE_FCNTL_WIN32_GET_HANDLE = @as(c_int, 29);
pub const SQLITE_FCNTL_PDB = @as(c_int, 30);
pub const SQLITE_FCNTL_BEGIN_ATOMIC_WRITE = @as(c_int, 31);
pub const SQLITE_FCNTL_COMMIT_ATOMIC_WRITE = @as(c_int, 32);
pub const SQLITE_FCNTL_ROLLBACK_ATOMIC_WRITE = @as(c_int, 33);
pub const SQLITE_FCNTL_LOCK_TIMEOUT = @as(c_int, 34);
pub const SQLITE_FCNTL_DATA_VERSION = @as(c_int, 35);
pub const SQLITE_FCNTL_SIZE_LIMIT = @as(c_int, 36);
pub const SQLITE_FCNTL_CKPT_DONE = @as(c_int, 37);
pub const SQLITE_FCNTL_RESERVE_BYTES = @as(c_int, 38);
pub const SQLITE_FCNTL_CKPT_START = @as(c_int, 39);
pub const SQLITE_FCNTL_EXTERNAL_READER = @as(c_int, 40);
pub const SQLITE_FCNTL_CKSM_FILE = @as(c_int, 41);
pub const SQLITE_FCNTL_RESET_CACHE = @as(c_int, 42);
pub const SQLITE_FCNTL_NULL_IO = @as(c_int, 43);
pub const SQLITE_FCNTL_BLOCK_ON_CONNECT = @as(c_int, 44);
pub const SQLITE_FCNTL_FILESTAT = @as(c_int, 45);
pub const SQLITE_GET_LOCKPROXYFILE = SQLITE_FCNTL_GET_LOCKPROXYFILE;
pub const SQLITE_SET_LOCKPROXYFILE = SQLITE_FCNTL_SET_LOCKPROXYFILE;
pub const SQLITE_LAST_ERRNO = SQLITE_FCNTL_LAST_ERRNO;
pub const SQLITE_ACCESS_EXISTS = @as(c_int, 0);
pub const SQLITE_ACCESS_READWRITE = @as(c_int, 1);
pub const SQLITE_ACCESS_READ = @as(c_int, 2);
pub const SQLITE_SHM_UNLOCK = @as(c_int, 1);
pub const SQLITE_SHM_LOCK = @as(c_int, 2);
pub const SQLITE_SHM_SHARED = @as(c_int, 4);
pub const SQLITE_SHM_EXCLUSIVE = @as(c_int, 8);
pub const SQLITE_SHM_NLOCK = @as(c_int, 8);
pub const SQLITE_CONFIG_SINGLETHREAD = @as(c_int, 1);
pub const SQLITE_CONFIG_MULTITHREAD = @as(c_int, 2);
pub const SQLITE_CONFIG_SERIALIZED = @as(c_int, 3);
pub const SQLITE_CONFIG_MALLOC = @as(c_int, 4);
pub const SQLITE_CONFIG_GETMALLOC = @as(c_int, 5);
pub const SQLITE_CONFIG_SCRATCH = @as(c_int, 6);
pub const SQLITE_CONFIG_PAGECACHE = @as(c_int, 7);
pub const SQLITE_CONFIG_HEAP = @as(c_int, 8);
pub const SQLITE_CONFIG_MEMSTATUS = @as(c_int, 9);
pub const SQLITE_CONFIG_MUTEX = @as(c_int, 10);
pub const SQLITE_CONFIG_GETMUTEX = @as(c_int, 11);
pub const SQLITE_CONFIG_LOOKASIDE = @as(c_int, 13);
pub const SQLITE_CONFIG_PCACHE = @as(c_int, 14);
pub const SQLITE_CONFIG_GETPCACHE = @as(c_int, 15);
pub const SQLITE_CONFIG_LOG = @as(c_int, 16);
pub const SQLITE_CONFIG_URI = @as(c_int, 17);
pub const SQLITE_CONFIG_PCACHE2 = @as(c_int, 18);
pub const SQLITE_CONFIG_GETPCACHE2 = @as(c_int, 19);
pub const SQLITE_CONFIG_COVERING_INDEX_SCAN = @as(c_int, 20);
pub const SQLITE_CONFIG_SQLLOG = @as(c_int, 21);
pub const SQLITE_CONFIG_MMAP_SIZE = @as(c_int, 22);
pub const SQLITE_CONFIG_WIN32_HEAPSIZE = @as(c_int, 23);
pub const SQLITE_CONFIG_PCACHE_HDRSZ = @as(c_int, 24);
pub const SQLITE_CONFIG_PMASZ = @as(c_int, 25);
pub const SQLITE_CONFIG_STMTJRNL_SPILL = @as(c_int, 26);
pub const SQLITE_CONFIG_SMALL_MALLOC = @as(c_int, 27);
pub const SQLITE_CONFIG_SORTERREF_SIZE = @as(c_int, 28);
pub const SQLITE_CONFIG_MEMDB_MAXSIZE = @as(c_int, 29);
pub const SQLITE_CONFIG_ROWID_IN_VIEW = @as(c_int, 30);
pub const SQLITE_DBCONFIG_MAINDBNAME = @as(c_int, 1000);
pub const SQLITE_DBCONFIG_LOOKASIDE = @as(c_int, 1001);
pub const SQLITE_DBCONFIG_ENABLE_FKEY = @as(c_int, 1002);
pub const SQLITE_DBCONFIG_ENABLE_TRIGGER = @as(c_int, 1003);
pub const SQLITE_DBCONFIG_ENABLE_FTS3_TOKENIZER = @as(c_int, 1004);
pub const SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSION = @as(c_int, 1005);
pub const SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE = @as(c_int, 1006);
pub const SQLITE_DBCONFIG_ENABLE_QPSG = @as(c_int, 1007);
pub const SQLITE_DBCONFIG_TRIGGER_EQP = @as(c_int, 1008);
pub const SQLITE_DBCONFIG_RESET_DATABASE = @as(c_int, 1009);
pub const SQLITE_DBCONFIG_DEFENSIVE = @as(c_int, 1010);
pub const SQLITE_DBCONFIG_WRITABLE_SCHEMA = @as(c_int, 1011);
pub const SQLITE_DBCONFIG_LEGACY_ALTER_TABLE = @as(c_int, 1012);
pub const SQLITE_DBCONFIG_DQS_DML = @as(c_int, 1013);
pub const SQLITE_DBCONFIG_DQS_DDL = @as(c_int, 1014);
pub const SQLITE_DBCONFIG_ENABLE_VIEW = @as(c_int, 1015);
pub const SQLITE_DBCONFIG_LEGACY_FILE_FORMAT = @as(c_int, 1016);
pub const SQLITE_DBCONFIG_TRUSTED_SCHEMA = @as(c_int, 1017);
pub const SQLITE_DBCONFIG_STMT_SCANSTATUS = @as(c_int, 1018);
pub const SQLITE_DBCONFIG_REVERSE_SCANORDER = @as(c_int, 1019);
pub const SQLITE_DBCONFIG_ENABLE_ATTACH_CREATE = @as(c_int, 1020);
pub const SQLITE_DBCONFIG_ENABLE_ATTACH_WRITE = @as(c_int, 1021);
pub const SQLITE_DBCONFIG_ENABLE_COMMENTS = @as(c_int, 1022);
pub const SQLITE_DBCONFIG_MAX = @as(c_int, 1022);
pub const SQLITE_SETLK_BLOCK_ON_CONNECT = @as(c_int, 0x01);
pub const SQLITE_DENY = @as(c_int, 1);
pub const SQLITE_IGNORE = @as(c_int, 2);
pub const SQLITE_CREATE_INDEX = @as(c_int, 1);
pub const SQLITE_CREATE_TABLE = @as(c_int, 2);
pub const SQLITE_CREATE_TEMP_INDEX = @as(c_int, 3);
pub const SQLITE_CREATE_TEMP_TABLE = @as(c_int, 4);
pub const SQLITE_CREATE_TEMP_TRIGGER = @as(c_int, 5);
pub const SQLITE_CREATE_TEMP_VIEW = @as(c_int, 6);
pub const SQLITE_CREATE_TRIGGER = @as(c_int, 7);
pub const SQLITE_CREATE_VIEW = @as(c_int, 8);
pub const SQLITE_DELETE = @as(c_int, 9);
pub const SQLITE_DROP_INDEX = @as(c_int, 10);
pub const SQLITE_DROP_TABLE = @as(c_int, 11);
pub const SQLITE_DROP_TEMP_INDEX = @as(c_int, 12);
pub const SQLITE_DROP_TEMP_TABLE = @as(c_int, 13);
pub const SQLITE_DROP_TEMP_TRIGGER = @as(c_int, 14);
pub const SQLITE_DROP_TEMP_VIEW = @as(c_int, 15);
pub const SQLITE_DROP_TRIGGER = @as(c_int, 16);
pub const SQLITE_DROP_VIEW = @as(c_int, 17);
pub const SQLITE_INSERT = @as(c_int, 18);
pub const SQLITE_PRAGMA = @as(c_int, 19);
pub const SQLITE_READ = @as(c_int, 20);
pub const SQLITE_SELECT = @as(c_int, 21);
pub const SQLITE_TRANSACTION = @as(c_int, 22);
pub const SQLITE_UPDATE = @as(c_int, 23);
pub const SQLITE_ATTACH = @as(c_int, 24);
pub const SQLITE_DETACH = @as(c_int, 25);
pub const SQLITE_ALTER_TABLE = @as(c_int, 26);
pub const SQLITE_REINDEX = @as(c_int, 27);
pub const SQLITE_ANALYZE = @as(c_int, 28);
pub const SQLITE_CREATE_VTABLE = @as(c_int, 29);
pub const SQLITE_DROP_VTABLE = @as(c_int, 30);
pub const SQLITE_FUNCTION = @as(c_int, 31);
pub const SQLITE_SAVEPOINT = @as(c_int, 32);
pub const SQLITE_COPY = @as(c_int, 0);
pub const SQLITE_RECURSIVE = @as(c_int, 33);
pub const SQLITE_TRACE_STMT = @as(c_int, 0x01);
pub const SQLITE_TRACE_PROFILE = @as(c_int, 0x02);
pub const SQLITE_TRACE_ROW = @as(c_int, 0x04);
pub const SQLITE_TRACE_CLOSE = @as(c_int, 0x08);
pub const SQLITE_LIMIT_LENGTH = @as(c_int, 0);
pub const SQLITE_LIMIT_SQL_LENGTH = @as(c_int, 1);
pub const SQLITE_LIMIT_COLUMN = @as(c_int, 2);
pub const SQLITE_LIMIT_EXPR_DEPTH = @as(c_int, 3);
pub const SQLITE_LIMIT_COMPOUND_SELECT = @as(c_int, 4);
pub const SQLITE_LIMIT_VDBE_OP = @as(c_int, 5);
pub const SQLITE_LIMIT_FUNCTION_ARG = @as(c_int, 6);
pub const SQLITE_LIMIT_ATTACHED = @as(c_int, 7);
pub const SQLITE_LIMIT_LIKE_PATTERN_LENGTH = @as(c_int, 8);
pub const SQLITE_LIMIT_VARIABLE_NUMBER = @as(c_int, 9);
pub const SQLITE_LIMIT_TRIGGER_DEPTH = @as(c_int, 10);
pub const SQLITE_LIMIT_WORKER_THREADS = @as(c_int, 11);
pub const SQLITE_PREPARE_PERSISTENT = @as(c_int, 0x01);
pub const SQLITE_PREPARE_NORMALIZE = @as(c_int, 0x02);
pub const SQLITE_PREPARE_NO_VTAB = @as(c_int, 0x04);
pub const SQLITE_PREPARE_DONT_LOG = @as(c_int, 0x10);
pub const SQLITE_INTEGER = @as(c_int, 1);
pub const SQLITE_FLOAT = @as(c_int, 2);
pub const SQLITE_BLOB = @as(c_int, 4);
pub const SQLITE_NULL = @as(c_int, 5);
pub const SQLITE_TEXT = @as(c_int, 3);
pub const SQLITE3_TEXT = @as(c_int, 3);
pub const SQLITE_UTF8 = @as(c_int, 1);
pub const SQLITE_UTF16LE = @as(c_int, 2);
pub const SQLITE_UTF16BE = @as(c_int, 3);
pub const SQLITE_UTF16 = @as(c_int, 4);
pub const SQLITE_ANY = @as(c_int, 5);
pub const SQLITE_UTF16_ALIGNED = @as(c_int, 8);
pub const SQLITE_DETERMINISTIC = @as(c_int, 0x000000800);
pub const SQLITE_DIRECTONLY = __helpers.promoteIntLiteral(c_int, 0x000080000, .hex);
pub const SQLITE_SUBTYPE = __helpers.promoteIntLiteral(c_int, 0x000100000, .hex);
pub const SQLITE_INNOCUOUS = __helpers.promoteIntLiteral(c_int, 0x000200000, .hex);
pub const SQLITE_RESULT_SUBTYPE = __helpers.promoteIntLiteral(c_int, 0x001000000, .hex);
pub const SQLITE_SELFORDER1 = __helpers.promoteIntLiteral(c_int, 0x002000000, .hex);
pub const SQLITE_STATIC = __helpers.cast(sqlite3_destructor_type, @as(c_int, 0));
pub const SQLITE_TRANSIENT = __helpers.cast(sqlite3_destructor_type, -@as(c_int, 1));
pub const SQLITE_WIN32_DATA_DIRECTORY_TYPE = @as(c_int, 1);
pub const SQLITE_WIN32_TEMP_DIRECTORY_TYPE = @as(c_int, 2);
pub const SQLITE_TXN_NONE = @as(c_int, 0);
pub const SQLITE_TXN_READ = @as(c_int, 1);
pub const SQLITE_TXN_WRITE = @as(c_int, 2);
pub const SQLITE_INDEX_SCAN_UNIQUE = @as(c_int, 0x00000001);
pub const SQLITE_INDEX_SCAN_HEX = @as(c_int, 0x00000002);
pub const SQLITE_INDEX_CONSTRAINT_EQ = @as(c_int, 2);
pub const SQLITE_INDEX_CONSTRAINT_GT = @as(c_int, 4);
pub const SQLITE_INDEX_CONSTRAINT_LE = @as(c_int, 8);
pub const SQLITE_INDEX_CONSTRAINT_LT = @as(c_int, 16);
pub const SQLITE_INDEX_CONSTRAINT_GE = @as(c_int, 32);
pub const SQLITE_INDEX_CONSTRAINT_MATCH = @as(c_int, 64);
pub const SQLITE_INDEX_CONSTRAINT_LIKE = @as(c_int, 65);
pub const SQLITE_INDEX_CONSTRAINT_GLOB = @as(c_int, 66);
pub const SQLITE_INDEX_CONSTRAINT_REGEXP = @as(c_int, 67);
pub const SQLITE_INDEX_CONSTRAINT_NE = @as(c_int, 68);
pub const SQLITE_INDEX_CONSTRAINT_ISNOT = @as(c_int, 69);
pub const SQLITE_INDEX_CONSTRAINT_ISNOTNULL = @as(c_int, 70);
pub const SQLITE_INDEX_CONSTRAINT_ISNULL = @as(c_int, 71);
pub const SQLITE_INDEX_CONSTRAINT_IS = @as(c_int, 72);
pub const SQLITE_INDEX_CONSTRAINT_LIMIT = @as(c_int, 73);
pub const SQLITE_INDEX_CONSTRAINT_OFFSET = @as(c_int, 74);
pub const SQLITE_INDEX_CONSTRAINT_FUNCTION = @as(c_int, 150);
pub const SQLITE_MUTEX_FAST = @as(c_int, 0);
pub const SQLITE_MUTEX_RECURSIVE = @as(c_int, 1);
pub const SQLITE_MUTEX_STATIC_MAIN = @as(c_int, 2);
pub const SQLITE_MUTEX_STATIC_MEM = @as(c_int, 3);
pub const SQLITE_MUTEX_STATIC_MEM2 = @as(c_int, 4);
pub const SQLITE_MUTEX_STATIC_OPEN = @as(c_int, 4);
pub const SQLITE_MUTEX_STATIC_PRNG = @as(c_int, 5);
pub const SQLITE_MUTEX_STATIC_LRU = @as(c_int, 6);
pub const SQLITE_MUTEX_STATIC_LRU2 = @as(c_int, 7);
pub const SQLITE_MUTEX_STATIC_PMEM = @as(c_int, 7);
pub const SQLITE_MUTEX_STATIC_APP1 = @as(c_int, 8);
pub const SQLITE_MUTEX_STATIC_APP2 = @as(c_int, 9);
pub const SQLITE_MUTEX_STATIC_APP3 = @as(c_int, 10);
pub const SQLITE_MUTEX_STATIC_VFS1 = @as(c_int, 11);
pub const SQLITE_MUTEX_STATIC_VFS2 = @as(c_int, 12);
pub const SQLITE_MUTEX_STATIC_VFS3 = @as(c_int, 13);
pub const SQLITE_MUTEX_STATIC_MASTER = @as(c_int, 2);
pub const SQLITE_TESTCTRL_FIRST = @as(c_int, 5);
pub const SQLITE_TESTCTRL_PRNG_SAVE = @as(c_int, 5);
pub const SQLITE_TESTCTRL_PRNG_RESTORE = @as(c_int, 6);
pub const SQLITE_TESTCTRL_PRNG_RESET = @as(c_int, 7);
pub const SQLITE_TESTCTRL_FK_NO_ACTION = @as(c_int, 7);
pub const SQLITE_TESTCTRL_BITVEC_TEST = @as(c_int, 8);
pub const SQLITE_TESTCTRL_FAULT_INSTALL = @as(c_int, 9);
pub const SQLITE_TESTCTRL_BENIGN_MALLOC_HOOKS = @as(c_int, 10);
pub const SQLITE_TESTCTRL_PENDING_BYTE = @as(c_int, 11);
pub const SQLITE_TESTCTRL_ASSERT = @as(c_int, 12);
pub const SQLITE_TESTCTRL_ALWAYS = @as(c_int, 13);
pub const SQLITE_TESTCTRL_RESERVE = @as(c_int, 14);
pub const SQLITE_TESTCTRL_JSON_SELFCHECK = @as(c_int, 14);
pub const SQLITE_TESTCTRL_OPTIMIZATIONS = @as(c_int, 15);
pub const SQLITE_TESTCTRL_ISKEYWORD = @as(c_int, 16);
pub const SQLITE_TESTCTRL_GETOPT = @as(c_int, 16);
pub const SQLITE_TESTCTRL_SCRATCHMALLOC = @as(c_int, 17);
pub const SQLITE_TESTCTRL_INTERNAL_FUNCTIONS = @as(c_int, 17);
pub const SQLITE_TESTCTRL_LOCALTIME_FAULT = @as(c_int, 18);
pub const SQLITE_TESTCTRL_EXPLAIN_STMT = @as(c_int, 19);
pub const SQLITE_TESTCTRL_ONCE_RESET_THRESHOLD = @as(c_int, 19);
pub const SQLITE_TESTCTRL_NEVER_CORRUPT = @as(c_int, 20);
pub const SQLITE_TESTCTRL_VDBE_COVERAGE = @as(c_int, 21);
pub const SQLITE_TESTCTRL_BYTEORDER = @as(c_int, 22);
pub const SQLITE_TESTCTRL_ISINIT = @as(c_int, 23);
pub const SQLITE_TESTCTRL_SORTER_MMAP = @as(c_int, 24);
pub const SQLITE_TESTCTRL_IMPOSTER = @as(c_int, 25);
pub const SQLITE_TESTCTRL_PARSER_COVERAGE = @as(c_int, 26);
pub const SQLITE_TESTCTRL_RESULT_INTREAL = @as(c_int, 27);
pub const SQLITE_TESTCTRL_PRNG_SEED = @as(c_int, 28);
pub const SQLITE_TESTCTRL_EXTRA_SCHEMA_CHECKS = @as(c_int, 29);
pub const SQLITE_TESTCTRL_SEEK_COUNT = @as(c_int, 30);
pub const SQLITE_TESTCTRL_TRACEFLAGS = @as(c_int, 31);
pub const SQLITE_TESTCTRL_TUNE = @as(c_int, 32);
pub const SQLITE_TESTCTRL_LOGEST = @as(c_int, 33);
pub const SQLITE_TESTCTRL_USELONGDOUBLE = @as(c_int, 34);
pub const SQLITE_TESTCTRL_LAST = @as(c_int, 34);
pub const SQLITE_STATUS_MEMORY_USED = @as(c_int, 0);
pub const SQLITE_STATUS_PAGECACHE_USED = @as(c_int, 1);
pub const SQLITE_STATUS_PAGECACHE_OVERFLOW = @as(c_int, 2);
pub const SQLITE_STATUS_SCRATCH_USED = @as(c_int, 3);
pub const SQLITE_STATUS_SCRATCH_OVERFLOW = @as(c_int, 4);
pub const SQLITE_STATUS_MALLOC_SIZE = @as(c_int, 5);
pub const SQLITE_STATUS_PARSER_STACK = @as(c_int, 6);
pub const SQLITE_STATUS_PAGECACHE_SIZE = @as(c_int, 7);
pub const SQLITE_STATUS_SCRATCH_SIZE = @as(c_int, 8);
pub const SQLITE_STATUS_MALLOC_COUNT = @as(c_int, 9);
pub const SQLITE_DBSTATUS_LOOKASIDE_USED = @as(c_int, 0);
pub const SQLITE_DBSTATUS_CACHE_USED = @as(c_int, 1);
pub const SQLITE_DBSTATUS_SCHEMA_USED = @as(c_int, 2);
pub const SQLITE_DBSTATUS_STMT_USED = @as(c_int, 3);
pub const SQLITE_DBSTATUS_LOOKASIDE_HIT = @as(c_int, 4);
pub const SQLITE_DBSTATUS_LOOKASIDE_MISS_SIZE = @as(c_int, 5);
pub const SQLITE_DBSTATUS_LOOKASIDE_MISS_FULL = @as(c_int, 6);
pub const SQLITE_DBSTATUS_CACHE_HIT = @as(c_int, 7);
pub const SQLITE_DBSTATUS_CACHE_MISS = @as(c_int, 8);
pub const SQLITE_DBSTATUS_CACHE_WRITE = @as(c_int, 9);
pub const SQLITE_DBSTATUS_DEFERRED_FKS = @as(c_int, 10);
pub const SQLITE_DBSTATUS_CACHE_USED_SHARED = @as(c_int, 11);
pub const SQLITE_DBSTATUS_CACHE_SPILL = @as(c_int, 12);
pub const SQLITE_DBSTATUS_TEMPBUF_SPILL = @as(c_int, 13);
pub const SQLITE_DBSTATUS_MAX = @as(c_int, 13);
pub const SQLITE_STMTSTATUS_FULLSCAN_STEP = @as(c_int, 1);
pub const SQLITE_STMTSTATUS_SORT = @as(c_int, 2);
pub const SQLITE_STMTSTATUS_AUTOINDEX = @as(c_int, 3);
pub const SQLITE_STMTSTATUS_VM_STEP = @as(c_int, 4);
pub const SQLITE_STMTSTATUS_REPREPARE = @as(c_int, 5);
pub const SQLITE_STMTSTATUS_RUN = @as(c_int, 6);
pub const SQLITE_STMTSTATUS_FILTER_MISS = @as(c_int, 7);
pub const SQLITE_STMTSTATUS_FILTER_HIT = @as(c_int, 8);
pub const SQLITE_STMTSTATUS_MEMUSED = @as(c_int, 99);
pub const SQLITE_CHECKPOINT_NOOP = -@as(c_int, 1);
pub const SQLITE_CHECKPOINT_PASSIVE = @as(c_int, 0);
pub const SQLITE_CHECKPOINT_FULL = @as(c_int, 1);
pub const SQLITE_CHECKPOINT_RESTART = @as(c_int, 2);
pub const SQLITE_CHECKPOINT_TRUNCATE = @as(c_int, 3);
pub const SQLITE_VTAB_CONSTRAINT_SUPPORT = @as(c_int, 1);
pub const SQLITE_VTAB_INNOCUOUS = @as(c_int, 2);
pub const SQLITE_VTAB_DIRECTONLY = @as(c_int, 3);
pub const SQLITE_VTAB_USES_ALL_SCHEMAS = @as(c_int, 4);
pub const SQLITE_ROLLBACK = @as(c_int, 1);
pub const SQLITE_FAIL = @as(c_int, 3);
pub const SQLITE_REPLACE = @as(c_int, 5);
pub const SQLITE_SCANSTAT_NLOOP = @as(c_int, 0);
pub const SQLITE_SCANSTAT_NVISIT = @as(c_int, 1);
pub const SQLITE_SCANSTAT_EST = @as(c_int, 2);
pub const SQLITE_SCANSTAT_NAME = @as(c_int, 3);
pub const SQLITE_SCANSTAT_EXPLAIN = @as(c_int, 4);
pub const SQLITE_SCANSTAT_SELECTID = @as(c_int, 5);
pub const SQLITE_SCANSTAT_PARENTID = @as(c_int, 6);
pub const SQLITE_SCANSTAT_NCYCLE = @as(c_int, 7);
pub const SQLITE_SCANSTAT_COMPLEX = @as(c_int, 0x0001);
pub const SQLITE_SERIALIZE_NOCOPY = @as(c_int, 0x001);
pub const SQLITE_DESERIALIZE_FREEONCLOSE = @as(c_int, 1);
pub const SQLITE_DESERIALIZE_RESIZEABLE = @as(c_int, 2);
pub const SQLITE_DESERIALIZE_READONLY = @as(c_int, 4);
pub const SQLITE_CARRAY_INT32 = @as(c_int, 0);
pub const SQLITE_CARRAY_INT64 = @as(c_int, 1);
pub const SQLITE_CARRAY_DOUBLE = @as(c_int, 2);
pub const SQLITE_CARRAY_TEXT = @as(c_int, 3);
pub const SQLITE_CARRAY_BLOB = @as(c_int, 4);
pub const CARRAY_INT32 = @as(c_int, 0);
pub const CARRAY_INT64 = @as(c_int, 1);
pub const CARRAY_DOUBLE = @as(c_int, 2);
pub const CARRAY_TEXT = @as(c_int, 3);
pub const CARRAY_BLOB = @as(c_int, 4);
pub const _SQLITE3RTREE_H_ = "";
pub const NOT_WITHIN = @as(c_int, 0);
pub const PARTLY_WITHIN = @as(c_int, 1);
pub const FULLY_WITHIN = @as(c_int, 2);
pub const _FTS5_H = "";
pub const FTS5_TOKENIZE_QUERY = @as(c_int, 0x0001);
pub const FTS5_TOKENIZE_PREFIX = @as(c_int, 0x0002);
pub const FTS5_TOKENIZE_DOCUMENT = @as(c_int, 0x0004);
pub const FTS5_TOKENIZE_AUX = @as(c_int, 0x0008);
pub const FTS5_TOKEN_COLOCATED = @as(c_int, 0x0001);
pub const _READLINE_H_ = "";
pub const _RL_STDC_H_ = "";
pub inline fn PARAMS(protos: anytype) @TypeOf(protos) {
    _ = &protos;
    return protos;
}
pub const _RL_TYPEDEFS_H_ = "";
pub const _RL_FUNCTION_TYPEDEF = "";
pub const rl_ivoidfunc_t = rl_hook_func_t;
pub const _KEYMAPS_H_ = "";
pub const _CHARDEFS_H_ = "";
pub const _CTYPE_H = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    _ = &HI;
    _ = &LO;
    return blk: {
        _ = &LO;
        break :blk HI;
    };
}
pub inline fn _ISbit(bit: anytype) @TypeOf(if (__helpers.cast(bool, bit < @as(c_int, 8))) (@as(c_int, 1) << bit) << @as(c_int, 8) else (@as(c_int, 1) << bit) >> @as(c_int, 8)) {
    _ = &bit;
    return if (__helpers.cast(bool, bit < @as(c_int, 8))) (@as(c_int, 1) << bit) << @as(c_int, 8) else (@as(c_int, 1) << bit) >> @as(c_int, 8);
}
pub inline fn __isctype(c: anytype, @"type": anytype) @TypeOf(__ctype_b_loc().*[@as(usize, @intCast(__helpers.cast(c_int, c)))] & __helpers.cast(c_ushort, @"type")) {
    _ = &c;
    _ = &@"type";
    return __ctype_b_loc().*[@as(usize, @intCast(__helpers.cast(c_int, c)))] & __helpers.cast(c_ushort, @"type");
}
pub inline fn __isascii(c: anytype) @TypeOf((c & ~@as(c_int, 0x7f)) == @as(c_int, 0)) {
    _ = &c;
    return (c & ~@as(c_int, 0x7f)) == @as(c_int, 0);
}
pub inline fn __toascii(c: anytype) @TypeOf(c & @as(c_int, 0x7f)) {
    _ = &c;
    return c & @as(c_int, 0x7f);
}
pub const __exctype = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include//ctype.h:102:9
pub const __tobody = @compileError("unable to translate macro: undefined identifier `__res`"); // /usr/include//ctype.h:155:9
pub const _BITS_TYPES_LOCALE_T_H = @as(c_int, 1);
pub const _BITS_TYPES___LOCALE_T_H = @as(c_int, 1);
pub inline fn __isctype_l(c: anytype, @"type": anytype, locale: anytype) @TypeOf(locale.*.__ctype_b[@as(usize, @intCast(__helpers.cast(c_int, c)))] & __helpers.cast(c_ushort, @"type")) {
    _ = &c;
    _ = &@"type";
    _ = &locale;
    return locale.*.__ctype_b[@as(usize, @intCast(__helpers.cast(c_int, c)))] & __helpers.cast(c_ushort, @"type");
}
pub const __exctype_l = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include//ctype.h:244:10
pub inline fn __isalnum_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISalnum, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISalnum, l);
}
pub inline fn __isalpha_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISalpha, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISalpha, l);
}
pub inline fn __iscntrl_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _IScntrl, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _IScntrl, l);
}
pub inline fn __isdigit_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISdigit, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISdigit, l);
}
pub inline fn __islower_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISlower, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISlower, l);
}
pub inline fn __isgraph_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISgraph, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISgraph, l);
}
pub inline fn __isprint_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISprint, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISprint, l);
}
pub inline fn __ispunct_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISpunct, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISpunct, l);
}
pub inline fn __isspace_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISspace, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISspace, l);
}
pub inline fn __isupper_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISupper, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISupper, l);
}
pub inline fn __isxdigit_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISxdigit, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISxdigit, l);
}
pub inline fn __isblank_l(c: anytype, l: anytype) @TypeOf(__isctype_l(c, _ISblank, l)) {
    _ = &c;
    _ = &l;
    return __isctype_l(c, _ISblank, l);
}
pub inline fn __isascii_l(c: anytype, l: anytype) @TypeOf(__isascii(c)) {
    _ = &c;
    _ = &l;
    return blk_1: {
        _ = &l;
        break :blk_1 __isascii(c);
    };
}
pub inline fn __toascii_l(c: anytype, l: anytype) @TypeOf(__toascii(c)) {
    _ = &c;
    _ = &l;
    return blk_1: {
        _ = &l;
        break :blk_1 __toascii(c);
    };
}
pub inline fn isascii_l(c: anytype, l: anytype) @TypeOf(__isascii_l(c, l)) {
    _ = &c;
    _ = &l;
    return __isascii_l(c, l);
}
pub inline fn toascii_l(c: anytype, l: anytype) @TypeOf(__toascii_l(c, l)) {
    _ = &c;
    _ = &l;
    return __toascii_l(c, l);
}
pub const _STRING_H = @as(c_int, 1);
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const _STRINGS_H = @as(c_int, 1);
pub inline fn whitespace(c: anytype) @TypeOf((c == ' ') or (c == '\t')) {
    _ = &c;
    return (c == ' ') or (c == '\t');
}
pub const control_character_threshold = @as(c_int, 0x020);
pub const control_character_mask = @as(c_int, 0x1f);
pub const meta_character_threshold = @as(c_int, 0x07f);
pub const control_character_bit = @as(c_int, 0x40);
pub const meta_character_bit = @as(c_int, 0x080);
pub const largest_char = @as(c_int, 255);
pub inline fn CTRL_CHAR(c: anytype) @TypeOf((c < control_character_threshold) and ((c & @as(c_int, 0x80)) == @as(c_int, 0))) {
    _ = &c;
    return (c < control_character_threshold) and ((c & @as(c_int, 0x80)) == @as(c_int, 0));
}
pub inline fn META_CHAR(c: anytype) @TypeOf((__helpers.cast(u8, c) > meta_character_threshold) and (__helpers.cast(u8, c) <= largest_char)) {
    _ = &c;
    return (__helpers.cast(u8, c) > meta_character_threshold) and (__helpers.cast(u8, c) <= largest_char);
}
pub inline fn CTRL(c: anytype) @TypeOf(c & control_character_mask) {
    _ = &c;
    return c & control_character_mask;
}
pub inline fn META(c: anytype) @TypeOf(c | meta_character_bit) {
    _ = &c;
    return c | meta_character_bit;
}
pub inline fn UNMETA(c: anytype) @TypeOf(c & ~meta_character_bit) {
    _ = &c;
    return c & ~meta_character_bit;
}
pub inline fn UNCTRL(c: anytype) @TypeOf(_rl_to_upper(c | control_character_bit)) {
    _ = &c;
    return _rl_to_upper(c | control_character_bit);
}
pub const UCHAR_MAX = @as(c_int, 255);
pub const CHAR_MAX = @as(c_int, 127);
pub inline fn IN_CTYPE_DOMAIN(c: anytype) @TypeOf((c >= @as(c_int, 0)) and (c <= CHAR_MAX)) {
    _ = &c;
    return (c >= @as(c_int, 0)) and (c <= CHAR_MAX);
}
pub inline fn NON_NEGATIVE(c: anytype) @TypeOf(__helpers.cast(u8, c) == c) {
    _ = &c;
    return __helpers.cast(u8, c) == c;
}
pub inline fn ISALNUM(c: anytype) @TypeOf((IN_CTYPE_DOMAIN(c) != 0) and (isalnum(__helpers.cast(u8, c)) != 0)) {
    _ = &c;
    return (IN_CTYPE_DOMAIN(c) != 0) and (isalnum(__helpers.cast(u8, c)) != 0);
}
pub inline fn ISALPHA(c: anytype) @TypeOf((IN_CTYPE_DOMAIN(c) != 0) and (isalpha(__helpers.cast(u8, c)) != 0)) {
    _ = &c;
    return (IN_CTYPE_DOMAIN(c) != 0) and (isalpha(__helpers.cast(u8, c)) != 0);
}
pub inline fn ISDIGIT(c: anytype) @TypeOf((IN_CTYPE_DOMAIN(c) != 0) and (isdigit(__helpers.cast(u8, c)) != 0)) {
    _ = &c;
    return (IN_CTYPE_DOMAIN(c) != 0) and (isdigit(__helpers.cast(u8, c)) != 0);
}
pub inline fn ISLOWER(c: anytype) @TypeOf((IN_CTYPE_DOMAIN(c) != 0) and (islower(__helpers.cast(u8, c)) != 0)) {
    _ = &c;
    return (IN_CTYPE_DOMAIN(c) != 0) and (islower(__helpers.cast(u8, c)) != 0);
}
pub inline fn ISPRINT(c: anytype) @TypeOf((IN_CTYPE_DOMAIN(c) != 0) and (isprint(__helpers.cast(u8, c)) != 0)) {
    _ = &c;
    return (IN_CTYPE_DOMAIN(c) != 0) and (isprint(__helpers.cast(u8, c)) != 0);
}
pub inline fn ISUPPER(c: anytype) @TypeOf((IN_CTYPE_DOMAIN(c) != 0) and (isupper(__helpers.cast(u8, c)) != 0)) {
    _ = &c;
    return (IN_CTYPE_DOMAIN(c) != 0) and (isupper(__helpers.cast(u8, c)) != 0);
}
pub inline fn ISXDIGIT(c: anytype) @TypeOf((IN_CTYPE_DOMAIN(c) != 0) and (isxdigit(__helpers.cast(u8, c)) != 0)) {
    _ = &c;
    return (IN_CTYPE_DOMAIN(c) != 0) and (isxdigit(__helpers.cast(u8, c)) != 0);
}
pub inline fn _rl_lowercase_p(c: anytype) @TypeOf((NON_NEGATIVE(c) != 0) and (ISLOWER(c) != 0)) {
    _ = &c;
    return (NON_NEGATIVE(c) != 0) and (ISLOWER(c) != 0);
}
pub inline fn _rl_uppercase_p(c: anytype) @TypeOf((NON_NEGATIVE(c) != 0) and (ISUPPER(c) != 0)) {
    _ = &c;
    return (NON_NEGATIVE(c) != 0) and (ISUPPER(c) != 0);
}
pub inline fn _rl_digit_p(c: anytype) @TypeOf((c >= '0') and (c <= '9')) {
    _ = &c;
    return (c >= '0') and (c <= '9');
}
pub inline fn _rl_alphabetic_p(c: anytype) @TypeOf((NON_NEGATIVE(c) != 0) and (ISALNUM(c) != 0)) {
    _ = &c;
    return (NON_NEGATIVE(c) != 0) and (ISALNUM(c) != 0);
}
pub inline fn _rl_pure_alphabetic(c: anytype) @TypeOf((NON_NEGATIVE(c) != 0) and (ISALPHA(c) != 0)) {
    _ = &c;
    return (NON_NEGATIVE(c) != 0) and (ISALPHA(c) != 0);
}
pub inline fn _rl_to_upper(c: anytype) @TypeOf(if (__helpers.cast(bool, _rl_lowercase_p(c))) toupper(__helpers.cast(u8, c)) else c) {
    _ = &c;
    return if (__helpers.cast(bool, _rl_lowercase_p(c))) toupper(__helpers.cast(u8, c)) else c;
}
pub inline fn _rl_to_lower(c: anytype) @TypeOf(if (__helpers.cast(bool, _rl_uppercase_p(c))) tolower(__helpers.cast(u8, c)) else c) {
    _ = &c;
    return if (__helpers.cast(bool, _rl_uppercase_p(c))) tolower(__helpers.cast(u8, c)) else c;
}
pub inline fn _rl_digit_value(x: anytype) @TypeOf(x - '0') {
    _ = &x;
    return x - '0';
}
pub inline fn _rl_isident(c: anytype) @TypeOf((ISALNUM(c) != 0) or (c == '_')) {
    _ = &c;
    return (ISALNUM(c) != 0) or (c == '_');
}
pub inline fn ISOCTAL(c: anytype) @TypeOf((c >= '0') and (c <= '7')) {
    _ = &c;
    return (c >= '0') and (c <= '7');
}
pub inline fn OCTVALUE(c: anytype) @TypeOf(c - '0') {
    _ = &c;
    return c - '0';
}
pub inline fn HEXVALUE(c: anytype) @TypeOf(if (__helpers.cast(bool, (c >= 'a') and (c <= 'f'))) (c - 'a') + @as(c_int, 10) else if (__helpers.cast(bool, (c >= 'A') and (c <= 'F'))) (c - 'A') + @as(c_int, 10) else c - '0') {
    _ = &c;
    return if (__helpers.cast(bool, (c >= 'a') and (c <= 'f'))) (c - 'a') + @as(c_int, 10) else if (__helpers.cast(bool, (c >= 'A') and (c <= 'F'))) (c - 'A') + @as(c_int, 10) else c - '0';
}
pub const NEWLINE = '\n';
pub const RETURN = CTRL('M');
pub const RUBOUT = @as(c_int, 0x7f);
pub const TAB = '\t';
pub const ABORT_CHAR = CTRL('G');
pub const PAGE = CTRL('L');
pub const SPACE = ' ';
pub const ESC = CTRL('[');
pub const KEYMAP_SIZE = @as(c_int, 257);
pub const ANYOTHERKEY = KEYMAP_SIZE - @as(c_int, 1);
pub const ISFUNC = @as(c_int, 0);
pub const ISKMAP = @as(c_int, 1);
pub const ISMACR = @as(c_int, 2);
pub const _TILDE_H_ = "";
pub const RL_READLINE_VERSION = @as(c_int, 0x0803);
pub const RL_VERSION_MAJOR = @as(c_int, 8);
pub const RL_VERSION_MINOR = @as(c_int, 3);
pub inline fn rl_clear_timeout() @TypeOf(rl_set_timeout(@as(c_int, 0), @as(c_int, 0))) {
    return rl_set_timeout(@as(c_int, 0), @as(c_int, 0));
}
// /usr/include//readline/readline.h:791:9: warning: macro 'rl_symbolic_link_hook' contains a runtime value, translated to function
pub inline fn rl_symbolic_link_hook() @TypeOf(rl_directory_completion_hook) {
    return rl_directory_completion_hook;
}
pub const READERR = -@as(c_int, 2);
pub const RL_PROMPT_START_IGNORE = '\x01';
pub const RL_PROMPT_END_IGNORE = '\x02';
pub const NO_MATCH = @as(c_int, 0);
pub const SINGLE_MATCH = @as(c_int, 1);
pub const MULT_MATCH = @as(c_int, 2);
pub const RL_STATE_NONE = @as(c_int, 0x0000000);
pub const RL_STATE_INITIALIZING = @as(c_int, 0x00000001);
pub const RL_STATE_INITIALIZED = @as(c_int, 0x00000002);
pub const RL_STATE_TERMPREPPED = @as(c_int, 0x00000004);
pub const RL_STATE_READCMD = @as(c_int, 0x00000008);
pub const RL_STATE_METANEXT = @as(c_int, 0x00000010);
pub const RL_STATE_DISPATCHING = @as(c_int, 0x00000020);
pub const RL_STATE_MOREINPUT = @as(c_int, 0x00000040);
pub const RL_STATE_ISEARCH = @as(c_int, 0x00000080);
pub const RL_STATE_NSEARCH = @as(c_int, 0x00000100);
pub const RL_STATE_SEARCH = @as(c_int, 0x00000200);
pub const RL_STATE_NUMERICARG = @as(c_int, 0x00000400);
pub const RL_STATE_MACROINPUT = @as(c_int, 0x00000800);
pub const RL_STATE_MACRODEF = @as(c_int, 0x00001000);
pub const RL_STATE_OVERWRITE = @as(c_int, 0x00002000);
pub const RL_STATE_COMPLETING = @as(c_int, 0x00004000);
pub const RL_STATE_SIGHANDLER = __helpers.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const RL_STATE_UNDOING = __helpers.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const RL_STATE_INPUTPENDING = __helpers.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const RL_STATE_TTYCSAVED = __helpers.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const RL_STATE_CALLBACK = __helpers.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const RL_STATE_VIMOTION = __helpers.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const RL_STATE_MULTIKEY = __helpers.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const RL_STATE_VICMDONCE = __helpers.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const RL_STATE_CHARSEARCH = __helpers.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const RL_STATE_REDISPLAYING = __helpers.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const RL_STATE_DONE = __helpers.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const RL_STATE_TIMEOUT = __helpers.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const RL_STATE_EOF = __helpers.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const RL_STATE_READSTR = __helpers.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const RL_SETSTATE = @compileError("unable to translate C expr: expected ')' instead got '|='"); // /usr/include//readline/readline.h:953:9
pub const RL_UNSETSTATE = @compileError("unable to translate C expr: expected ')' instead got '&='"); // /usr/include//readline/readline.h:954:9
pub inline fn RL_ISSTATE(x: anytype) @TypeOf(rl_readline_state & x) {
    _ = &x;
    return rl_readline_state & x;
}
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_FILE = struct__IO_FILE;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const __locale_struct = struct___locale_struct;
pub const _keymap_entry = struct__keymap_entry;
pub const undo_code = enum_undo_code;
pub const undo_list = struct_undo_list;
pub const _funmap = struct__funmap;
pub const readline_state = struct_readline_state;
