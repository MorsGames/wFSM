// WalrusFSM by Mors
// http://www.mors-games.com/
// Licensed under MPL 2.0. Please give credit if used, otherwise I will be very sad.

#macro __WALRUSFSM_VERSION "1.0.1"

show_debug_message("WalrusFSM v" + __WALRUSFSM_VERSION + " by Mors");

/// @func State()
/// @desc A state that can be added to a StateMachine.
function State() constructor {
	
	//The state that will come after this one when the "next" fuction of the state machine is called.
	next = -1;

	/// @func on_enter()
    /// @desc The function that gets called when the machine enters the current state.
	static on_enter = function() {}
	
	/// @func on_leave()
    /// @desc The function that gets called when the machine leaves the current state.
	static on_leave = function() {}
	
	/// @func update()
    /// @desc The function that gets called when the "update" fuction of the state machine is called.
	static update = function() {}
}

/// @func StateMachine()
/// @desc A finite state machine.
function StateMachine() constructor {
	
	__state_map = ds_map_create();
	current_state = -1;
	index = -1;
	
	/// @func add(index, state)
    /// @desc Add a state to the machine.
	/// @param {anything} _index The unique index varable used to keep track of the state. Using enums is recommended, but you can also use strings if you need to.
    /// @param {State} state The state to be added.
	static add = function(_index, state) { 
		__state_map[? _index] = state ;
		if (current_state == -1) {
			current_state = state;
			index = _index;
			current_state.on_enter();
		}
	}
	
	/// @func remove(index)
    /// @desc Remove a state from the machine.
	/// @param {anything} _index Index of the state that's going to be removed.
	static remove = function(_index) { 
		delete __state_map[? _index];
		ds_map_delete(__state_map, _index);
	}
	
	/// @func update()
    /// @desc Runs the update function of the current state.
	static update = function() {
		current_state.update();
	}
	
	/// @func change(index)
    /// @desc Changes the current state of the machine to the provided index.
	/// @param {anything} _index Index of the state that's going to be set as the new one.
	static change = function(_index) {
		var _next_state = __state_map[? _index];
		current_state.on_leave();
		current_state = _next_state;
		index = _index;
		current_state.on_enter();
	}
	
	/// @func next()
    /// @desc Changes the current state of the machine to the next one.
	static next = function() {
		change(current_state.next);
	}
	
	/// @func count()
    /// @desc Returns the number of states within the machine.
	/// @returns {number} The number of states within the machine.
	static count = function() {
		return ds_map_size(__state_map);
	}
	
	/// @func clear()
    /// @desc Clears all the states from the machine.
	static clear = function() {
		var _key = ds_map_find_first(__state_map);
		while (!is_undefined(__state_map[? _key])) {
			delete __state_map[? _key];
			_key = ds_map_find_next(__state_map, _key);
		}
		ds_map_clear(__state_map);
	}
	
	/// @func destroy()
    /// @desc Destroys the state machine to free the memory.
	static destroy = function() {
		clear();
		ds_map_destroy(__state_map);
	}
}