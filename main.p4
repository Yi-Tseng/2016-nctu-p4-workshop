#include "tables.p4"

control process_packet {
    if(packet_count_meta.count < 5) {
        apply(forward);
    } else {
        apply(drop);
    }

    apply(update_state);

    if(packet_count_meta.count >= 10) {
        apply(reset_count);
    }
}

control ingress {
    apply(state_lookup) {
        hit {
            process_packet();
        }
    }
}
