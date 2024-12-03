// A `Car` is created with a `Blueprint`, and represents a train car.

module tetsudo_factory::car;

use std::string::String;
use tetsudo_factory::blueprint::Blueprint;
use tetsudo_factory::seat::Seat;

public struct Car has key, store {
    id: UID,
    series: String,
    designation: String,
    numbering: String,
    has_aed: bool,
    has_conductor_compartment: bool,
    has_multipurpose_room: bool,
    has_restroom: bool,
    has_smoking_room: bool,
    has_telephone: bool,
    // A 2D vector of Seats, where the first dimension is the row and the second dimension is the seat.
    // For example, seats[0] could be a five-seat row that like so: [Seat(), Seat(), Seat(), Seat(), Seat()].
    seats: vector<vector<Seat>>,
}

public fun new(blueprint: &Blueprint, ctx: &mut TxContext): Car {
    let car = Car {
        id: object::new(ctx),
        series: blueprint.series(),
        designation: blueprint.designation(),
        numbering: blueprint.numbering(),
        has_aed: blueprint.has_aed(),
        has_conductor_compartment: blueprint.has_conductor_compartment(),
        has_multipurpose_room: blueprint.has_multipurpose_room(),
        has_restroom: blueprint.has_restroom(),
        has_smoking_room: blueprint.has_smoking_room(),
        has_telephone: blueprint.has_telephone(),
        seats: blueprint.seats(),
    };

    car
}
