control ingress {
    apply(state_lookup);

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
