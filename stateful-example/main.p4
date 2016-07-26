#include "tables.p4"

control process_packet {
    if(packet_count_meta.count < 5) {
        apply(forward);
    } else if(packet_count_meta.count < 10){
        apply(drop);
    } else {
      apply(reset_count);
    }

    apply(update_state);

}

control ingress {
    apply(state_lookup) {
        hit {
            process_packet();
        }
    }
}
