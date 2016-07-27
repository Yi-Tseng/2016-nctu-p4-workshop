#include "headers.p4"

parser start {
    return select(current(0, 24)) {
        0xc0ffee: parse_my_path_header;
        default: parse_my_header;
    }
}

parser parse_my_path_header {
    extract(my_path_header);
    return parse_my_header;
}

parser parse_my_header {
    extract(my_header);
    return ingress;
}
