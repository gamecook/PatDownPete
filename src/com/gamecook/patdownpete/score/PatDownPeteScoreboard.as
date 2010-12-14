/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/13/10
 * Time: 11:22 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.score {
import com.gamecook.scores.FScoreboard;

public class PatDownPeteScoreboard extends FScoreboard{
    public static const ID:String = "PatDownPeteScoreboard"
    public static const MAX_SCORES:int = 5;

    public function PatDownPeteScoreboard() {
        super(ID, MAX_SCORES);

        //TODO need to remove this is just for testing
        //clearScoreboard();

        if (total == 0)
        {
            var defaultScores:Array = [
                {initials:"BUM", score: 1000},
                {initials:"Wil", score: 900},
                {initials:"CDE", score: 500},
                {initials:"FOR", score: 400},
                {initials:"FOD", score: 100}
            ];

            scores = defaultScores;
        };
    }
}
}
