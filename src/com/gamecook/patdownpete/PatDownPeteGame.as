/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/13/10
 * Time: 10:41 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete {
import com.gamecook.patdownpete.managers.SingletonManager;
import com.gamecook.patdownpete.managers.StateManager;
import com.gamecook.patdownpete.states.BaseState;

import com.gamecook.patdownpete.utils.FrameCounter;

import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.utils.getTimer;

public class PatDownPeteGame extends Sprite {

    public static const FRAME_RATE:int = 30;
    private var defaultX:int = 0;
    private var defaultY:int = 0;
    private var period:Number = 1000 / FRAME_RATE;
    private var beforeTime:int = 0;
    private var afterTime:int = 0;
    private var timeDiff:int = 0;
    private var sleepTime:int = 0;
    private var overSleepTime:int = 0;
    private var excess:int = 0;
    private var gameTimer:Timer;
    private var frameTimer:FrameCounter;
    private var stateManager:StateManager = SingletonManager.getClassReference(StateManager) as StateManager;

    public function PatDownPeteGame(x:int, y:int, state:Class, scale:Number = 1) {
        this.x = defaultX = x;
        this.y = defaultY = y;
        scaleX = scaleY = scale;

        stateManager.target = this;
        stateManager.state = state;

        // Create Flixel Game.
        //super(width, height, StartState, 1);
        gameTimer = new Timer(period, 1); //changed in part 3 from 50
        gameTimer.addEventListener(TimerEvent.TIMER, runGame);
        frameTimer = new FrameCounter();
    }

    private function runGame(event:TimerEvent):void {
        beforeTime = getTimer();
        overSleepTime = (beforeTime - afterTime) - sleepTime;

        stateManager.updateCurrentState((beforeTime - afterTime));

        afterTime = getTimer();
        timeDiff = afterTime - beforeTime;
        sleepTime = (period - timeDiff) - overSleepTime;
        if (sleepTime <= 0) {
            excess -= sleepTime
            sleepTime = 2;
        }
        gameTimer.reset();
        gameTimer.delay = sleepTime;
        gameTimer.start();

        while (excess > period) {
            stateManager.updateCurrentState();
            excess -= period;
        }

        frameTimer.countFrames();
        event.updateAfterEvent();

    }

    public function activate():void {
        gameTimer.start();
    }

    public function pause():void {
        gameTimer.stop();
    }

}
}
