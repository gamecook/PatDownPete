/*
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.gamecook.patdownpete.states {
import com.gamecook.patdownpete.managers.AssetManager;
import com.gamecook.patdownpete.managers.SingletonManager;
import com.gamecook.patdownpete.managers.StateManager;
import com.gamecook.patdownpete.score.PatDownPeteScoreboard;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;

public class BaseState extends Sprite {

    protected var scoreboard:PatDownPeteScoreboard;
    protected var nextScreen:Class;
    protected var nextScreenCounter:Number = 0;
    protected var nextScreenDelay:Number = 0;
    protected var stateManager:StateManager = SingletonManager.getClassReference(StateManager) as StateManager;
    protected var assetManager:AssetManager = SingletonManager.getClassReference(AssetManager) as AssetManager;

    public function BaseState() {
        super();
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
        create();
    }

    protected function onAddedToStage(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true);

        // Add more added logic here
    }

    protected function onRemovedFromStage(event:Event):void {
        removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);

        // Add more remove logic here
    }

    public function create():void {

        scoreboard = new PatDownPeteScoreboard();
    }

    protected function startNextScreenTimer(state:Class, delay:int = 15):void {
        nextScreenDelay = delay;
        nextScreen = state;
    }

    protected function onNextScreen(event:TimerEvent = null):void {
        stateManager.state = new nextScreen();
    }

    public function update(elapsed:Number = 0):void {
        if (nextScreen) {
            nextScreenCounter += elapsed;
            if (nextScreenCounter >= nextScreenDelay)
                onNextScreen();
        }
    }

}
}
