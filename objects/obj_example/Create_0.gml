/// @desc An example object

// The states as an enum
enum test_state {
	example1,
	example2,
	example3
}

// Some variables for demonstration
text = "";
color = c_white;

// Create the finite state machine
state_machine = new StateMachine();

// ------------
#region State 1
// ------------

// Create state 1
var _state1 = new State();

// The state that will come after this one when we use the "next()" method
_state1.next = test_state.example2;

// Set the state methods
_state1.on_enter = function() {
	text = "It is the first state!\n\nPress Space to go to the next state.";
}
_state1.update = function() {
	color = make_color_hsv(100, sin(state_machine.timer()/12)*128+127, 255);
}

// Add the state to the finite state machine
state_machine.add(test_state.example1, _state1);

#endregion

// ------------
#region State 2
// ------------

// Create state 2
var _state2 = new State();

// The state that will come after this one when we use the "next()" method
_state2.next = test_state.example3;

// Set the state methods
_state2.on_enter = function() {
	text = "It is the second state, woohoo!!!\n\nYou should try pressing R to reset the current\nstate! You can also press D to destroy it.";
}
_state2.update = function() {
	color = make_color_hsv(sin(state_machine.timer()/64)*128+127, 255, 255);
}

// Add the state to the finite state machine
state_machine.add(test_state.example2, _state2);

#endregion

// ------------
#region State 3
// ------------

// Create state 3
var _state3 = new State();

// The state that will come after this one when we use the "next()" method
_state3.next = test_state.example1;

// Set the state methods
_state3.on_enter = function() {
	text = "IT IS THE THIRD STATE! Wow! Amazing!\n\nYou can use the number keys to switch states\ntoo!";
	color = $21C7FF;
}
_state3.on_update = function() {
	x = xstart+random_range(-4, 4);
	y = ystart+random_range(-4, 4);
}
_state3.on_draw = function() {
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);
	draw_text_transformed(xstart, room_height-ystart, "The states can have custom events as well.\nThis text is drawn with a custom event!", 1, 1, abs(sin(state_machine.timer()/32))*5);
	draw_set_valign(fa_top);
}
_state3.on_leave = function() {
	x = xstart;
	y = ystart;
}

// Add the state to the finite state machine
state_machine.add(test_state.example3, _state3);

#endregion