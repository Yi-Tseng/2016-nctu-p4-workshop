#include "parser.p4"
#include "header.p4"
#include "registers.p4"

table state_lookup {
    actions {
        action_state_look_up;
    }
}

action action_state_look_up() {
    register_read(packet_count_meta.count, packet_count_reg, my_header.src);
}

table forward {
    reads {
        my_header.dst: exact;
    }
    actions {
        action_forward;
    }
}

action action_forward(out_port) {
    modify_field(standard_metadata.egress_spec, out_port);
}

table drop {
    actions {
        action_drop;
    }
}

action action_drop() {
    drop();
}

table update_state {
    actions {
        action_state_update;
    }
}

action action_state_update() {
    add_to_field(packet_count_meta.count, 1);
    register_write(packet_count_reg, my_header.src, packet_count_meta.count);
}

table reset_count {
    actions {
        action_reset_count;
    }
}

action action_reset_count() {
    modify_field(packet_count_meta.count, 0);
    register_write(packet_count_reg, my_header.src, packet_count_meta.count);
}
