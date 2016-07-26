header_type my_path_header_t {
    fields {
        identifier: 24;
        path: 16;
    }
}

header my_path_header_t my_path_header;

header_type my_header_t {
    fields {
        src: 16;
        dst: 16;
    }
}

header my_header_t my_header;
