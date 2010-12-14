/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/13/10
 * Time: 10:48 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.states {
import com.gamecook.patdownpete.sprites.GameAssets;

import org.flixel.FlxSprite;

public class GameState extends BaseState{
    public function GameState() {
    }

    override public function create():void {
        super.create();

        bgColor = 0x0000000;

        var sprite:FlxSprite = new FlxSprite(0, 0, GameAssets.GameStateBG);
        add(sprite);
    }
}
}
