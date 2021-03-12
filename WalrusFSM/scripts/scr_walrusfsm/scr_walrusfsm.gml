// WalrusFSM by Mors
// http://www.mors-games.com/
// Licensed under MPL 2.0. Please give credit if used, otherwise I will be very sad.

#macro __WALRUSFSM_VERSION "1.1.1"

show_debug_message("WalrusFSM v" + __WALRUSFSM_VERSION + " by Mors");

/// @func State()
/// @desc A state that can be added to a StateMachine.
function State() constructor {
    
    // The state that will come after this one when the "next" fuction of the state machine is called.
    next = -1;

    /// @func on_enter()
    /// @desc The function that gets called when StateMachine enters the current state.
    static on_enter = function() {}
    
    /// @func on_leave()
    /// @desc The function that gets called when StateMachine leaves the current state.
    static on_leave = function() {}
    
    /// @func update()
    /// @desc The function that gets called when the "update" fuction of StateMachine is called.
    static update = function() {}
    
    /// @func draw()
    /// @desc The function that gets called when the "draw" fuction of StateMachine is called.
    static draw = function() {}
}

/// @func StateMachine()
/// @desc A finite state machine.
function StateMachine() constructor {
    
    // Variables that were intended to be private. GameMaker doesn't have private variables yet, so I'm just putting 2 underscores before their names.
    __state_map = ds_map_create();
    __current_state = -1;
    __index = -1;
    __state_timer = 0;
    
    /// @func add(index, state)
    /// @desc Adds a state to the finite state machine.
    /// @param {anything} index The unique index varable used to keep track of the state. Using enums is recommended, but you can also use strings if you really want to.
    /// @param {State} state The state to be added.
    static add = function(index, state) { 
        __state_map[? index] = state ;
        if (__current_state == -1) {
            __current_state = state;
            __index = index;
            __current_state.on_enter();
        }
    }
    
    /// @func remove(index)
    /// @desc Removes a state from the finite state machine.
    /// @param {anything} index Index of the state that's going to be removed.
    static remove = function(index) { 
        delete __state_map[? index];
        ds_map_delete(__state_map, index);
    }
    
    /// @func change(index)
    /// @desc Changes the current state of StateMachine to the provided index.
    /// @param {anything} index Index of the state that's going to be set as the new one.
    static change = function(index) {
        var _next_state = __state_map[? index];
        __current_state.on_leave();
        __current_state = _next_state;
        __index = index;
        __state_timer = 0;
        __current_state.on_enter();
    }
    
    /// @func next()
    /// @desc Changes the current state of the current StateMachine to the next one.
    static next = function() {
        change(__current_state.next);
    }
    
    /// @func reset()
    /// @desc Works similarly to "change(index)" but it will "change" to the state that is already running, essentially resetting the current state. 
    static reset = function() {
        __current_state.on_leave();
        __state_timer = 0;
        __current_state.on_enter();
    }
    
    /// @func get()
    /// @desc Returns the current state index of the current StateMachine.
    /// @returns {real} The current state index of the current StateMachine.
    static get = function() {
        return __index;
    }
    
    /// @func count()
    /// @desc Returns the number of states within the current StateMachine.
    /// @returns {real} The number of states within the current StateMachine.
    static count = function() {
        return ds_map_size(__state_map);
    }
    
    /// @func timer()
    /// @desc Returns the number of frames that have passed since the State has been initialized.
    /// @returns {real} The number of frames that have passed since the State has been initialized.
    static timer = function() {
        return __state_timer;
    }
    
    /// @func clear()
    /// @desc Clears all the states from the current StateMachine.
    static clear = function() {
        var _key = ds_map_find_first(__state_map);
        while (!is_undefined(__state_map[? _key])) {
            delete __state_map[? _key];
            _key = ds_map_find_next(__state_map, _key);
        }
        ds_map_clear(__state_map);
    }
    
    /// @func destroy()
    /// @desc Destroys the current StateMachine to free the memory.
    static destroy = function() {
        clear();
        ds_map_destroy(__state_map);
    }
	    
    /// @func update()
    /// @desc Executes the "update" function of the current State.
    static update = function() {
        __current_state.update();
        __state_timer++;
    }
    
    /// @func draw()
    /// @desc Executes the "draw" function of the current State.
    static draw = function() {
        __current_state.draw();
    }
}