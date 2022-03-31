/// @desc Draw the text

draw_set_font(fnt_example);
draw_set_color(color);
draw_text(x, y, text+"\n\nState " + string(state_machine.get()+1) + " of " + string(state_machine.count()) + "!");

// Run the state machine draw code
state_machine.run_event("on_draw");

draw_set_color(c_white);