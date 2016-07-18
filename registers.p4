register packet_count_reg {
    width: 8; // max is 5, we only need 3 bits
    instance_count: 65535; // all possible host needs a counter
}
