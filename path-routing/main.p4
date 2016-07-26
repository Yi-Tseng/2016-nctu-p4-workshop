#include "tables.p4"


control ingress {
    if(not valid(my_path_header)) {
        apply(path_lookup);
    }
    apply(forward);
}
