const x = @extern(*const fn() callconv(.C) void, .{ .name = "foo" });

pub fn entry0() void {
    comptime x();
}

pub fn entry1() void {
    @call(.always_inline, x, .{});
}

// error
// backend=stage2
// target=native
//
// :4:15: error: comptime call of extern function pointer
// :8:5: error: inline call of extern function pointer
