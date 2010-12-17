/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/13/10
 * Time: 10:48 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.states
{
    import com.gamecook.patdownpete.managers.MoodManager;
    import com.gamecook.patdownpete.sprites.ColorMap;
    import com.gamecook.patdownpete.sprites.Matte;

    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.text.TextField;

    public class GameState extends BaseState
    {
        private static const BASE_GAME_TIME:int = 60000;
        private static const BASE_MOOD_DELAY:int = 1000;

        private var timerBar:Matte;
        private var gameTimer:int = 0;
        private var colorMap:ColorMap;
        private var timeDisplay:TextField;
        private var time:int;
        private const GAME_OVER:String = "gameOver";
        private var mode:String;
        private const GAME_RUNNING:String = "gameRunning";
        private var score:Number = 0;
        private var scoreDisplay:TextField;
        private var moodManager:MoodManager;
        private var moodDelay:Number = 0;
        private var faces:Array;
        private var activeFace:Bitmap;
        private var nextFaceID:int = 0;
        private var activeFaceID:int = -1;
        private var facePreview:Bitmap;

        public function GameState()
        {
        }

        override public function create():void
        {
            super.create();

            time = 60;

            gameTimer = BASE_GAME_TIME;

            addChild(assetManager.getBitmap("GameStateBG"));

            timerBar = new Matte(460, 100, 440, 18, 0xffffff, .74);
            timerBar.scaleX = 0;
            addChild(timerBar);

            colorMap = new ColorMap(assetManager.getBitmap("ColorMap").bitmapData, new Rectangle(0, 0, 480, 7));

            timeDisplay = textFieldFactory.createTimer();
            timeDisplay.x = (width - timeDisplay.width) * .5;

            addChild(timeDisplay);

            scoreDisplay = textFieldFactory.createScore("left");
            scoreDisplay.x = 40;
            addChild(scoreDisplay);

            moodManager = new MoodManager();

            createFaces();

            render();

            mode = GAME_RUNNING;

        }

        private function createFaces():void
        {
            faces = [assetManager.getBitmap("FacesHappy").bitmapData,
                     assetManager.getBitmap("FacesOK").bitmapData,
                     assetManager.getBitmap("FacesContent").bitmapData,
                     assetManager.getBitmap("FacesSurprised").bitmapData,
                     assetManager.getBitmap("FacesShocked").bitmapData,
                     assetManager.getBitmap("FacesWorried").bitmapData,
                     assetManager.getBitmap("FacesAnnoyed").bitmapData];

            activeFace = new Bitmap();
            activeFace.x = 170;
            activeFace.y = 180;
            addChild(activeFace);
            nextFaceID = 0;


            facePreview  = new Bitmap(createPreviewFace(), "auto", true);
            facePreview.scaleX = facePreview.scaleY = .4;
            addChild(facePreview);
        }

        private function createPreviewFace(id:int = 0):BitmapData
        {
            var bg:Bitmap = assetManager.getBitmap("FaceBackground");
            var face:BitmapData = faces[id].clone();

            bg.bitmapData.copyPixels(face, new Rectangle(0, 0, face.width, face.height), new Point(30,42), null, null, true);

            return bg.bitmapData;
        }

        override protected function render():void
        {
            scoreDisplay.text = "Score:\n" + formatNumber(score);
            timeDisplay.text = time.toString();
            timerBar.scaleX = -moodManager.mood;

            if (nextFaceID != activeFaceID && nextFaceID < faces.length)
            {
                activeFaceID = nextFaceID;
                activeFace.bitmapData = BitmapData(faces[activeFaceID]).clone();
                facePreview.bitmapData = createPreviewFace(activeFaceID);
            }


        }

        override public function update(elapsed:Number = 0):void
        {
            if (mode == GAME_RUNNING)
            {

                gameTimer -= elapsed;
                moodDelay += elapsed;


                time = Math.round((gameTimer / BASE_GAME_TIME) * 60);

                if (mouseManager.isMouseDown)
                {
                    var partID:int = colorMap.testCollision(mouseManager.mousePosition);
                    score += partID;

                    if (moodDelay >= BASE_MOOD_DELAY)
                    {
                        moodManager.modifyMood(partID);
                        moodDelay = 0;
                    }
                }
                else
                {
                    moodManager.modifyMood(-.05);
                }

                if (time < 1)
                    gameOver();

                nextFaceID = (moodManager.mood * faces.length);
                if(nextFaceID < 0) nextFaceID = 0;

            }

            super.update(elapsed);
        }

        private function gameOver():void
        {
            mode = GAME_OVER;
        }

        private function formatNumber(my_number:Number):String
        {
            // array in sections of 3 to separate with commas
            var strNumber:String = my_number.toString();
            var dollar_array:Array = new Array();
            var start:Number;
            var end:Number = strNumber.length;

            while (end > 0)
            {
                start = Math.max(end - 3, 0);
                dollar_array.unshift(strNumber.slice(start, end));
                end = start;
            }

            // assign a comma delimited value from dollar_array
            return dollar_array.join(",");
        }
    }
}
