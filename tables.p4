#include "parser.p4"
#include "header.p4"
#include "registers.p4"

table state_lookup {
    reads {
        my_header.src;
    }
    actions {
        action_state_look_up;
    }
}

action action_state_look_up(reg_index) {
    register_read(packet_count_meta.count, packet_count_reg, reg_index)
}

table forward {
    reads {
        my_header.dst;
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
    no_op();
}

table update_state {
    reads {
        my_header.src;
    }
    actions {
        action_state_update;
    }
}

action action_state_update(reg_index) {
    add_to_field(packet_count_meta.count, 1);
    register_write(packet_count_reg, reg_index, packet_count_meta.count);
}

table reset_count {
    reads {
        my_header.src;
    }
    actions {
        action_reset_count;
    }
}

action action_reset_count(reg_index) {
    modify_field(packet_count_meta.count, 0);
    register_write(packet_count_reg, reg_index, packet_count_meta.count);
}
