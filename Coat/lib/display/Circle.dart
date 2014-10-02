part of Coat.Display;

class Circle extends DisplayObject {
    num _radius;
    Color _color;
    num _strokeThickness;
    Color _stroke;
    Point _center;

    num get radius => _radius;
    Color get color => _color;
    Color get stroke => _stroke;
    num get strokeThickness => _strokeThickness;

    set radius(value) {
        _radius = value;
        Resize();
    }

    set color(value) {
        _color = value;
        Resize();
    }

    set stroke(value) {
        _stroke = value;
        Resize();
    }

    set strokeThickness(value) {
        _strokeThickness = value;
        Resize();
    }

    Circle(this._radius, this._color, [this._stroke = null, this._strokeThickness = 0]) {

        if (_stroke == null) _stroke = new Color(0);

        Resize();
    }

    @override Resize() {
        _width = 2 * _radius.round();
        _height = 2 * _radius.round();
        _center = new Point(_radius, _radius);

        super.Resize();
    }

    @override SelfDraw() {

        _ctx.clearRect(0, 0, _width, _height);
        _ctx.fillStyle = _color.toString();
        _ctx.strokeStyle = _stroke.toString();
        _ctx.lineWidth = _strokeThickness;
        _ctx.beginPath();
        _ctx.arc(_center.x, _center.y, _radius - _strokeThickness, 0, 2 * PI, false);
        _ctx.closePath();
        _ctx.fill();

        if (_strokeThickness > 0) _ctx.stroke();


        super.SelfDraw();
    }

}
