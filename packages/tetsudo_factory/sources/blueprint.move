module tetsudo_factory::blueprint;

use std::string::String;
use tetsudo_factory::seat::Seat;

public struct Blueprint has key {
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
    seats: vector<Seat>,
}

public fun new(
    series: String,
    designation: String,
    numbering: String,
    has_aed: bool,
    has_conductor_compartment: bool,
    has_multipurpose_room: bool,
    has_restroom: bool,
    has_smoking_room: bool,
    has_telephone: bool,
    ctx: &mut TxContext,
): Blueprint {
    let blueprint = Blueprint {
        id: object::new(ctx),
        series: series,
        designation: designation,
        has_aed: has_aed,
        has_conductor_compartment: has_conductor_compartment,
        has_multipurpose_room: has_multipurpose_room,
        has_restroom: has_restroom,
        has_smoking_room: has_smoking_room,
        has_telephone: has_telephone,
        numbering: numbering,
        seats: vector[],
    };

    blueprint
}

public fun add_seat(blueprint: &mut Blueprint, seat: Seat) {
    blueprint.seats.push_back(seat);
}

public fun id(blueprint: &Blueprint): ID {
    object::id(blueprint)
}

public fun series(blueprint: &Blueprint): String {
    blueprint.series
}

public fun designation(blueprint: &Blueprint): String {
    blueprint.designation
}

public fun numbering(blueprint: &Blueprint): String {
    blueprint.numbering
}

public fun has_aed(blueprint: &Blueprint): bool {
    blueprint.has_aed
}

public fun has_conductor_compartment(blueprint: &Blueprint): bool {
    blueprint.has_conductor_compartment
}

public fun has_multipurpose_room(blueprint: &Blueprint): bool {
    blueprint.has_multipurpose_room
}

public fun has_restroom(blueprint: &Blueprint): bool {
    blueprint.has_restroom
}

public fun has_smoking_room(blueprint: &Blueprint): bool {
    blueprint.has_smoking_room
}

public fun has_telephone(blueprint: &Blueprint): bool {
    blueprint.has_telephone
}

public fun seats(blueprint: &Blueprint): vector<Seat> {
    blueprint.seats
}