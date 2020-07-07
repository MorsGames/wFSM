/// @desc A more simplistic example object.

// The states as an enum.
enum test_state_simple {
	example1,
	example2,
}

// Create the finite state machine
state_machine = new StateMachine();

// Create state 1.
var _state1 = new State();

// Set the code that will be executed at the step event.
_state1.update = function() {
	x += 4;
	if (x > room_width)
		x = -256
}

// Create state 2.
var _state2 = new State();

// Set the code that will be executed at the step event.
_state2.update = function() {
	x -= 4;
	if (x < -256)
		x = room_width
}

// Add the states to the finite state machine.
state_machine.add(test_state_simple.example1, _state1);
state_machine.add(test_state_simple.example2, _state2);