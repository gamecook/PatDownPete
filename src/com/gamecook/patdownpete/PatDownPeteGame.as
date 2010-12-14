/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/13/10
 * Time: 10:41 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete {
import com.gamecook.patdownpete.states.StartState;

import org.flixel.FlxGame;

public class PatDownPeteGame extends FlxGame {

    private var defaultX:int = 0;
    private var defaultY:int = 0;

    public function PatDownPeteGame(x:int = 0, y:int = 0, width:int = 480, height:int = 800) {
        this.x = defaultX = x;
        this.y = defaultY = y;

        // Create Flixel Game.
        super(width, height, StartState, 1);

    }

    override public function showSoundTray(Silent:Boolean = false):void {
        //super.showSoundTray(Silent);
    }


    override public function set x(value:Number):void {
        super.x = defaultX;
    }

    override public function set y(value:Number):void {
        super.y = defaultY;
    }
}
}
