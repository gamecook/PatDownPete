/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/13/10
 * Time: 10:47 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.states {

public class StartState extends BaseState{

    //private var startMask:FlxSprite;
    private var flickerTime:int = 0;
    private const FLICKER_DELAY:int = 100;
    private var counter:int = 0;

    public function StartState() {

        addChild(assetManager.getBitmap("StartStateBG"));
        /*bgColor = 0x0000000;


        var sprite:FlxSprite = new FlxSprite(0, 0, GameAssets.StartStateBG);
        add(sprite);

        startMask = new FlxSprite(140,750);
        startMask.createGraphic(200,40,0xFF65c5d8);
        add(startMask);*/

        nextScreenCounter = 1000;
    }

    override public function create():void {
        super.create();

        flickerTime = FLICKER_DELAY;
    }

    override public function update(elapsed:Number = 0):void
    {
        nextScreenCounter -= elapsed;

        if (nextScreenCounter <= 0)
        {
            trace("Next Screen");
            nextScreenCounter = 1000;
        }
        /*if (FlxG.mouse.justPressed())
            onClick();

        flickerTime -= FlxG.elapsed;
        if (flickerTime <= 0)
        {
            startMask.visible = !startMask.visible;
            flickerTime = FLICKER_DELAY;
        }

        super.render();*/
    }

    private function onClick():void {
        //FlxG.state = new GameState();
    }
}
}
