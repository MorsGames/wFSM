# WalrusFSM v1.1.0

**WalrusFSM** is an easy to use and robust **Finite State Machine** library for **GameMaker Studio 2.3+**.

[Download from itch.io!](https://mors-games.itch.io/WalrusFSM)

Finite state machines are structures that can exist in a set amount of predefined states that contain unique behaviors. While finite state machines are used very commonly in game development, GameMaker does not have a built-in way of setting them up easily. This library allows you to set up your own finite state machines with minimal effort, and helps you keep them all organized.

## Basic Usage

```gml
// The states as an enum.
enum test_state {
	example1,
	example2,
}

// Create the finite state machine.
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
state_machine.add(test_state.example1, _state1);
state_machine.add(test_state.example2, _state2);
```


## Details
This library comes with 12 public methods for the StateMachine struct.
- add(index, state)
- remove(index)
- update()
- draw()
- change(index)
- next()
- reset()
- get()
- count()
- timer()
- clear()
- destroy()

There are also 4 overridable methods for the State struct that are by default empty.
- on_enter()
- on_leave()
- update()
- draw()

This library is only tested on Windows and HTML5 platforms, but it should also work on other platforms as well. It also comes with an example project that will teach you the basics.

The entirety of this project is licensed under **MPL 2.0**, so please give me credit if you end up using it.


## Changelog
v1.1.0 (07/07/2020):
- Added "draw", "reset", "get", and "timer" methods.
- Slightly improved the code.
- Improved the comments.
- There are now 2 example objects and rooms. One is more simplistic, while the other one showcases all the functions of the library.

v1.0.1 (27/06/2020):
- Made the code more consistent.
- Made the example look fancier.
- Rewrote the description.
- Changed the license to MPL 2.0.

v1.0.0 (14/06/2020):
- Initial release.

If you have any questions, you can ask them on this project's [itch.io page](https://mors-games.itch.io/WalrusFSM) or at my [Discord Server](https://discord.gg/4jgSARF).
