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

state_machine = new StateMachine();

// State 1
var _state1 = new State();
_state1.next = test_state.example2;
_state1.on_enter = function() {
	text = "It is the first state!";
}
_state1.update = function() {
	color = make_color_hsv(100, sin(current_time/256)*128+127, 255);
}
state_machine.add(test_state.example1, _state1);

// State 2
var _state2 = new State();
_state2.next = test_state.example3;
_state2.on_enter = function() {
	text = "It is the second state, wohoo!!!";
}
_state2.update = function() {
	color = make_color_hsv(sin(current_time/512)*128+127, 255, 255);
}
state_machine.add(test_state.example2, _state2);

// State 3
var _state3 = new State();
_state3.next = test_state.example1;
_state3.on_enter = function() {
	text = "IT IS THE THIRD STATE! Wow! Amazing!";
	color = $21C7FF;
}
_state3.update = function() {
	x = xstart+random_range(-4, 4);
	y = ystart+random_range(-4, 4);
}
_state3.on_leave = function() {
	x = xstart;
	y = ystart;
}
state_machine.add(test_state.example3, _state3);