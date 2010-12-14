package {
import com.gamecook.patdownpete.PatDownPeteGame;

import flash.display.Sprite;

/**
 * @author jessefreeman
 */
[SWF(width="480",height="800",backgroundColor="#65c5d8",frameRate="60")]
public class PatDownPete extends Sprite {

    public function PatDownPete() {

        var game:PatDownPeteGame = new PatDownPeteGame();

        CONFIG::mobile
        {
            if (stage.fullScreenWidth > 480)
                game.scaleX = game.scaleY = stage.fullScreenWidth / 480;
        }

        addChild(game);
    }

}
}
