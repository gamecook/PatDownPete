/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/14/10
 * Time: 9:49 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.managers {
import flash.display.Bitmap;
import flash.utils.describeType;

import org.hamcrest.collection.hasItem;

public class AssetManager extends Object{

    [Embed(source="../../../../../build/assets/StartStateBG.jpg")]
    private var StartStateBG:Class;

    [Embed(source="../../../../../build/assets/GameStateBG.jpg")]
    private var GameStateBG:Class;

    public function getBitmap(id:String):Bitmap
    {
        if (!hasItem(id)) {
            return null;
        } else return new this[id]() as Bitmap;
    }

}
}
