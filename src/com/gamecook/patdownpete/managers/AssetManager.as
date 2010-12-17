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

    [Embed(source="../../../../../build/assets/color_map.png")]
    private var ColorMap:Class;

    [Embed(source="../../../../../build/assets/faces_annoyed.png")]
    private var FacesAnnoyed:Class;

    [Embed(source="../../../../../build/assets/faces_content.png")]
    private var FacesContent:Class;

    [Embed(source="../../../../../build/assets/faces_happy.png")]
    private var FacesHappy:Class;

    [Embed(source="../../../../../build/assets/faces_ok.png")]
    private var FacesOK:Class;

    [Embed(source="../../../../../build/assets/faces_shocked.png")]
    private var FacesShocked:Class;

    [Embed(source="../../../../../build/assets/faces_surprised.png")]
    private var FacesSurprised:Class;

    [Embed(source="../../../../../build/assets/faces_worried.png")]
    private var FacesWorried:Class;

    [Embed(source="../../../../../build/assets/face_background.png")]
    private var FaceBackground:Class;

    public function getBitmap(id:String):Bitmap
    {
        if (!hasItem(id)) {
            return null;
        } else return new this[id]() as Bitmap;
    }

}
}
