function get_segment(aid, size) {
    var start = 0, end = 0;
    var count_switch = true;
    for (var i = 1; i <= size; i++) {
        if (document.getElementById(aid + i.toString()).style.display != 'none') {
            if (count_switch) {
                start = i;
                count_switch = false;
            } else {
                end = i;
            }
        }
    }
    return [start, end];
}

function prev_page_turn(aid, start, end, step) {
    for (var i = 0; i < step; i++) {
        if (start == 1)
            break;

        $("#" + aid + end.toString()).hide(200);

        start -= 1;

        $("#" + aid + start.toString()).show(200);

        end -= 1;
    }
}

function next_page_turn(aid, start, end, step, size) {
    for (var i = 0; i < step; i++) {
        if (end == size)
            break;

        $("#" + aid + start.toString()).hide(200);

        end += 1;

        $("#" + aid + end.toString()).show(200);

        start += 1;
    }
}