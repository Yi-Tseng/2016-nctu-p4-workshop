#include "headers.p4"

parser start {
    return parse_my_header;
}

parser parse_my_header {
    extract(my_header);
    return ingress;
}
