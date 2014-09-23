part of Coat.Display;

class Box extends DisplayObject {

    Color _color;
    Color _stroke;
    num _strokeThickness;

    Color get color => _color;
    set color(value) {
        _color = value;
        Resize();
    }

    Color get stroke => _stroke;
    set stroke(value) {
        _stroke = value;
        Resize();
    }

    num get strokeThickness => _strokeThickness;
    set strokeThickness(value) {
        _strokeThickness = value;
        Resize();
    }

    Box(num width, num height, this._color, [this._stroke = null, this._strokeThickness = 0]){
        _width = width;
        _height = height;

        if(_stroke== null) _stroke = new Color(0);

        Resize();
    }

    @override Resize() {

        super.Resize();

        _ctx.clearRect(0, 0, _width, _height);
        _ctx.fillStyle = _color.toString();
        _ctx.strokeStyle = _stroke.toString();
        _ctx.lineWidth = _strokeThickness;
        _ctx.fillRect(0, 0, _bounds.width, _bounds.height);
        _ctx.fill();

        if (_strokeThickness > 0) _ctx.strokeRect(0, 0, _bounds.width, _bounds.height);
    }
}
