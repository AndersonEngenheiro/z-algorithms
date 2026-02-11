// percorrer cada elemento de um array e comparar se ele é maior ou menor;
// trocar de posiçao se for maior

const std = @import("std");

pub fn sort(A: []i32) void {
    var i: usize = 1;
    while (i < A.len) : (i += 1) {
        const x = A[i]; // index of array position at moment
        var j = i;
        while (j > 0 and A[j - 1] > x) : (j -= 1) {
            A[j] = A[j - 1];
        }
        A[j] = x;
    }
}

pub fn main() void {
    var array: [5]i32 = .{ 10, 30, 20, 50, 15 };
    sort(&array);

    for (array) |value| {
        std.debug.print("{d}\n ", .{value});
    }
}
