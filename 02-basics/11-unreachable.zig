const expect = @import("std").testing.expect;

// test "unreachable" {
//     const x: u8 = 1;
//     const y: u8 = if (x == 3) 5 else unreachable;
//     _ = y;
// }

fn asciiToUpper(x: u8) u8 {
    return switch (x) {
        'a'...'z' => x + 'A' - 'a',
        'A'...'Z' => x,
        else => unreachable,
    };
}

test "unreachable switch" {
    try expect(asciiToUpper('a') == 'A');
}
