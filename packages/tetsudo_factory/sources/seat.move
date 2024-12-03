// A `Seat` is a seat in a train car.

module tetsudo_factory::seat;

public struct Seat has copy, drop, store {
    row: u8,
    seat: u8,
    is_wheelchair_accessible: bool,
}

public fun new(row: u8, seat: u8, is_wheelchair_accessible: bool): Seat {
    let seat = Seat {
        row: row,
        seat: seat,
        is_wheelchair_accessible: is_wheelchair_accessible,
    };

    seat
}

public fun is_wheelchair_accessible(seat: &Seat): bool {
    seat.is_wheelchair_accessible
}

public fun row(seat: &Seat): u8 {
    seat.row
}

public fun seat(seat: &Seat): u8 {
    seat.seat
}
