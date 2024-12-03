// A `Seat` is a seat in a train car.

module tetsudo_factory::seat;

use std::string::String;

public struct Seat has copy, drop, store {
    row: u8,
    seat: String,
    slug: String,
    is_wheelchair_accessible: bool,
}

public fun new(row: u8, seat: String, is_wheelchair_accessible: bool): Seat {
    let mut slug = b"".to_string();
    slug.append(row.to_string());
    slug.append(b"::".to_string());
    slug.append(seat);

    let seat = Seat {
        row: row,
        seat: seat,
        slug: slug,
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

public fun seat(seat: &Seat): String {
    seat.seat
}

public fun slug(seat: &Seat): String {
    seat.slug
}
