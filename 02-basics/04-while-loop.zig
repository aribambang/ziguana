const expect = @import("std").testing.expect;

test "usual while loop" {
    var i: u8 = 2;

    while (i < 100) {
        i *= 2;
    }

    try expect(i == 128);
}

test "while loop with continue expression" {
    var sum: u8 = 0;
    var i: u8 = 1;

    while (i <= 10) : (i += 1) {
        sum += i;
    }

    try expect(sum == 55);
}

test "while loop with continue" {
    var sum: u8 = 0;
    var i: u8 = 1;

    while (i <= 10) : (i += 1) {
        if (i == 2) continue;
        sum += i;
    }

    try expect(sum == 53);
}

test "while loop with break" {
    var sum: u8 = 0;
    var i: u8 = 1;

    while (i <= 10) : (i += 1) {
        if (i == 2) break;
        sum += i;
    }

    try expect(sum == 1);
}
