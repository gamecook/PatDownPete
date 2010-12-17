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
 * /
 */

/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 12/16/10
 * Time: 10:57 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.patdownpete.factories
{
    import flash.text.StyleSheet;
    import flash.text.TextField;
    import flash.text.TextFormat;

    public class TextFieldFactory
    {
        public function TextFieldFactory()
        {
        }

        public function createScore(align:String = "left"):TextField
        {
            var tf:TextField = createTextField();
            var tfx:TextFormat = createTextFormat();

            tf.multiline = true;
            tf.autoSize = align;
            tf.width = 120;
            tf.defaultTextFormat = tfx;

            return tf;
        }

        public function createTimer():TextField
        {
            var tf:TextField = createTextField();
            var tfx:TextFormat = createTextFormat();

            tfx.size = 60;
            tfx.align = "center";

            tf.defaultTextFormat = tfx;
            tf.width = 100;

            return tf;

        }
        private function createTextField():TextField
        {
            var  tmpTF:TextField = new TextField();
            tmpTF.selectable = false;
            return tmpTF;
        }

        private function createTextFormat():TextFormat
        {
            return new TextFormat("Ariel", 18, 0xffffff);
        }

    }
}