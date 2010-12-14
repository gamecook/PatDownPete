/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/13/10
 * Time: 10:47 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.states {
import com.gamecook.patdownpete.sprites.GameAssets;

import org.flixel.FlxG;
import org.flixel.FlxSprite;

public class StartState extends BaseState{

    private var startMask:FlxSprite;
    private var flickerTime:int = 0;
    private const FLICKER_DELAY:int = 100;

    public function StartState() {
        bgColor = 0x0000000;

        var sprite:FlxSprite = new FlxSprite(0, 0, GameAssets.StartStateBG);
        add(sprite);

        startMask = new FlxSprite(140,750);
        startMask.createGraphic(200,40,0xFF65c5d8);
        add(startMask);
    }

    override public function create():void {
        super.create();

        flickerTime = FLICKER_DELAY;
    }

    override public function update():void
    {
        if (FlxG.mouse.justPressed())
            onClick();

        flickerTime -= FlxG.elapsed;
        if (flickerTime <= 0)
        {
            startMask.visible = !startMask.visible;
            flickerTime = FLICKER_DELAY;
        }

        super.render();
    }

    private function onClick():void {
        FlxG.state = new GameState();
    }
}
}
