const std = @import("std");
const mem = std.mem;
const expect = std.testing.expect;

pub fn sort(A: []i32) void {
    var n = A.len;
    while (n > 1) {
        var new_n: usize = 0;
        for (A[0 .. n - 1], 0..) |value, i| {
            if (value > A[i + 1]) {
                mem.swap(i32, &A[i], &A[i + 1]);
                new_n = i + 1;
                std.debug.print("value:{}\n", .{value});
            }
        }
        n = new_n;
    }
}

test "sorted array" {
    var array: [10]i32 = .{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    sort(&array);
    for (array, 0..) |value, i| {
        try expect(value == (i + 1));
    }
}
