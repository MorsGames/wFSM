/// @desc Draw the text.

draw_set_font(fnt_example);
draw_set_color($21C7FF);
draw_text(x, y, "State no: " + string(state_machine.get()));
draw_text(xstart, y+128, "Press 1 or 2 to change states.");
draw_set_color(c_white);