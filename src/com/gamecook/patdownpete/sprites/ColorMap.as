/*
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 *
 * User: Jesse Freeman
 * Date: 12/15/10
 * Time: 9:43 PM
 *
 */
package com.gamecook.patdownpete.sprites
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class ColorMap extends Bitmap
    {

        private var colorMap:Array = [];
        private var colorKey:Rectangle;

        public function ColorMap(bitmapData:BitmapData, colorKey:Rectangle)
        {
            super(bitmapData);
            parseColorMap(colorKey);
        }

        public function parseColorMap(colorKey:Rectangle):void
        {
            this.colorKey = colorKey;

            if (bitmapData)
            {
                var pixel:uint;

                for (var x:int = colorKey.x; x < colorKey.width; x++)
                {
                    for (var y:int = colorKey.y; y < colorKey.height; y++)
                    {
                        pixel = bitmapData.getPixel(x, y);
                        if (colorMap.indexOf(pixel) == -1)
                        {
                            colorMap.push(pixel);
                        }
                    }
                }

            }
            else
            {
                throw new Error("You must have BitmapData before parsing a color map.");
            }

        }

        public function clear():void
        {
            bitmapData = null;
            colorMap.length = 0;
        }

        public function testCollision(point:Point):int
        {
            if (colorKey.containsPoint(point))
                return 0;

            var index:int = colorMap.indexOf(bitmapData.getPixel(point.x, point.y));
            return index == -1 ? 0 : index;

        }
    }
}
