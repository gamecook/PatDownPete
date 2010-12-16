/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/13/10
 * Time: 10:48 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.states
{
    import com.gamecook.patdownpete.sprites.ColorMap;
    import com.gamecook.patdownpete.sprites.Matte;

    import flash.geom.Rectangle;

    public class GameState extends BaseState
    {
        private static const BASE_GAME_TIME:int = 60000;

        private var timerBar:Matte;
        private var gameTimer:int = 0;
        private var colorMap:ColorMap;

        public function GameState()
        {
        }

        override public function create():void
        {
            super.create();

            gameTimer = BASE_GAME_TIME;

            addChild(assetManager.getBitmap("GameStateBG"));

            timerBar = new Matte(460, 100, 440, 18, 0xffffff, .74);
            timerBar.scaleX = 0;
            addChild(timerBar);

            colorMap = new ColorMap(assetManager.getBitmap("ColorMap").bitmapData, new Rectangle(0, 0, 480, 7));
            //addChild(colorMap);
        }


        override public function update(elapsed:Number = 0):void
        {
            super.update(elapsed);

            gameTimer -= elapsed;


            timerBar.scaleX = -(gameTimer / BASE_GAME_TIME);


            if(mouseManager.isMouseDown)
            {
                trace("Touching Part", colorMap.testCollision(mouseManager.mousePosition));
            }

        }
    }
}
