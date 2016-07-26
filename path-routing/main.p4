#include "tables.p4"


control ingress {

    if(!my_path_header.valid) {
        apply(path_look_up);
    }

    apply(forward);

    return egress;
}
