#include "parsers.p4"

table path_lookup {
    reads {
        my_header.src: exact;
        my_header.dst: exact;
    }

    actions {
        action_path_lookup;
    }

}

action action_path_lookup(path_no) {
    add_header(my_path_header);
    modify_field(my_path_header.identifier, 0xc0ffee);
    modify_field(my_path_header.path, path_no);
}

table forward {
    reads {
        my_path_header.path: exact;
    }

    actions {
        action_forward;
        action_forward_pop_path;
    }
}

action action_forward(out_port) {
    modify_field(standard_metadata.egress_spec, out_port);
}

action action_forward_pop_path(out_port) {
    modify_field(standard_metadata.egress_spec, out_port);
    remove_header(my_path_header);
}


