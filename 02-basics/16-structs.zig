const expect = @import("std").testing.expect;

const struct1 = struct { x: f32, y: f32, z: f32 };

test "creating struct" {
    const struct1_created = struct1{ .x = 10, .y = 10.2, .z = 50 };
    _ = struct1_created;
}

const Stuff = struct {
    x: i32,
    y: i32,
    fn swap(self: *Stuff) void {
        var temp = self.x;
        self.x = self.y;
        self.y = temp;
    }
};

test "defereference" {
    var thing = Stuff{ .x = 20, .y = 10 };
    thing.swap();
    try expect(thing.x == 10);
    try expect(thing.y == 20);
}
