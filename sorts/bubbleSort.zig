const std = @import("std");
const mem = std.mem;
const expect = std.testing.expect;

// A: []i32 é um slice de inteiros;
// void -> a funçao nao retorna nada;

pub fn sort(A: []i32) void {
    var n = A.len;
    while (n > 1) {
        var new_n: usize = 0;
        // 0.. é a sintaxe do Zig para gerar um índice automático(i) começando em zero
        for (A[0 .. n - 1], 0..) |value, i| {
            if (value > A[i + 1]) {
                // trocar os ponteiros da memória
                mem.swap(i32, &A[i], &A[i + 1]);
                new_n = i + 1;
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

pub fn main() void {
    var array: [5]i32 = .{ 70, 20, 0, 50, 210 };
    sort(&array);
    // imprime o array ordenado
    for (array, 0..) |value, i| {
        std.debug.print("{d} at index {d}\n  ", .{ value, i });
    }
}
