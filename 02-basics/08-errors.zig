const expect = @import("std").testing.expect;

const FileOpenError = error{ AccessDenied, OutOfMemory, FileNotFound };

const AllocationError = error{OutOfMemory};

test "coerce error from a subset to a superset" {
    const err: FileOpenError = AllocationError.OutOfMemory;

    try expect(err == FileOpenError.OutOfMemory);
}

test "error union" {
    const maybe_error: AllocationError!u16 = 10;
    const no_error = maybe_error catch 0;

    try expect(@TypeOf(no_error) == u16);
    try expect(no_error == 10);
}

fn failingFunc() error{Oops}!void {
    return error.Oops;
}

test "returning an error" {
    failingFunc() catch |err| {
        try expect(err == error.Oops);
    };
}

fn failFn() error{Oops}!i32 {
    try failingFunc();
    return 12;
}

test "try" {
    var v = failFn() catch |err| {
        try expect(err == error.Oops);
        return;
    };

    try expect(v == 12);
}

var problems: i32 = 99;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1;
    try failingFunc();
}

test "errdefer" {
    failFnCounter() catch |err| {
        try expect(err == error.Oops);
        try expect(problems == 100);
        return;
    };

    try expect(problems == 99);
}

fn createFile() !void {
    return error.AccessDenied;
}

test "inferred error set" {
    const x: error{AccessDenied}!void = createFile();

    _ = x catch {};
}

const A = error{ NotDir, PathNotFound };
const B = error{ OutOfMemory, PathNotFound };
const C = A || B;
