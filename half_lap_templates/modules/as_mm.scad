module as_mm(convert_to_mm = false) {
    if(convert_to_mm == false) {
        children();
    } else {
        scale([25.4,25.4,25.4]){ // inches to mm
            children();
        }
    }
}
