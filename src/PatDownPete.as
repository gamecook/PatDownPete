package {
import com.gamecook.patdownpete.PatDownPeteGame;

import com.gamecook.patdownpete.states.StartState;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import net.hires.debug.Stats;

/**
 * @author jessefreeman
 */
[SWF(width="480",height="800",backgroundColor="#65c5d8",frameRate="60")]
public class PatDownPete extends Sprite {

    private var game:PatDownPeteGame;

    public function PatDownPete() {

        configureStage();
        game= new PatDownPeteGame(0,0, StartState);

        CONFIG::mobile
        {
            if (stage.fullScreenWidth > 480)
                game.scaleX = game.scaleY = stage.fullScreenWidth / 480;
        }

        addChild(game);
        trace("Hello");
        game.activate();

        addChild( new Stats() );
    }

    private function configureStage():void {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
    }

}
}
