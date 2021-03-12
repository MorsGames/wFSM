# WalrusFSM v1.1.1

**WalrusFSM** is an easy-to-use and robust **Finite State Machine** library for **GameMaker Studio 2.3+**.

[API Reference](https://github.com/MorsGames/WalrusFSM/wiki) | [itch.io](https://mors-games.itch.io/WalrusFSM) | [YoYo Marketplace](https://marketplace.yoyogames.com/assets/9387/walrusfsm)

Finite state machines are structures that can exist in a set amount of predefined states that contain unique behaviors. While finite state machines are used very commonly in game development, GameMaker does not have a built-in way of setting them up easily. This library allows you to set up your own finite state machines with minimal effort, and helps you keep them all organized.

This library is only tested on the **Windows** and **HTML5** targets, but it should work on other platforms as well. It also comes with an example project that will teach you the basics.

Since I made this library primarily for my own personal projects, I will keep updating it on a regular basis.


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

To learn more about how to use this library, check out the [API Reference](https://github.com/MorsGames/WalrusFSM/wiki).


## License
This library is licensed under **MPL 2.0**. You can learn more about it [here](https://www.mozilla.org/en-US/MPL/2.0/FAQ/).


## Changelog
v1.1.1 (12/03/2021):
- Made some minor changes to the comments and the description.
- Added the [API Reference](https://github.com/MorsGames/WalrusFSM/wiki).

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

If you have any questions, you can ask them on this project's [itch.io page](https://mors-games.itch.io/WalrusFSM) or create an issue in this repository.
