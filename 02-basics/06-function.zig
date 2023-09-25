const expect = @import("std").testing.expect;

fn addFive(x: u32) u32 {
    return x + 5;
}

test "function" {
    const y = addFive(5);

    try expect(y == 10);
    try expect(@TypeOf(y) == u32);
}

fn fibonnaci(n: u16) u16 {
    if (n == 0 or n == 1) return n;

    return fibonnaci(n - 1) + fibonnaci(n - 2);
}

test "recursive function" {
    const fib = fibonnaci(10);

    try expect(fib == 55);
}
