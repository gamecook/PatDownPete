/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/14/10
 * Time: 9:08 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.managers {
import com.gamecook.patdownpete.states.BaseState;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

public class StateManager {

    private var _currentState:BaseState;
    private var _target:DisplayObjectContainer;

    public function StateManager() {
    }

    public function set target(target:DisplayObjectContainer):void
    {
        _target = target;
    }

    public function set state(state:Class)
    {
        if(_currentState)
        {
            _target.removeChild(_currentState);
        }

        _currentState = new state();

        _target.addChild(_currentState);

    }

    public function updateCurrentState(overSleepTime:Number = 0):void {
        if(_currentState)
            _currentState.update(overSleepTime);
    }
}
}
