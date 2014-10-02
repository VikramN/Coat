part of Coat.Display;

class TextFld extends DisplayObject{

    Color _fontColor;
    int _fontSize;
    String _font;

    set FontColor(Color value) {
        _fontColor = value;
        _redraw = true;
    }

    Color get FontColor => _fontColor;

    TextFld(this._fontColor, this._fontSize, this._font);

    String _text;

    get text => _text;

    set text(String value){
        _text = value;
        _redraw = true;
    }

    @override SelfDraw(){
        _ctx
            ..clearRect(0, 0, width, height)
            ..font = '$_fontSize' + 'px ' + _font
            ..fillStyle = _fontColor.toString()
            ..fillText(_text, 0, _fontSize);

        _redraw = false;
    }

}