part of Coat.Display;

class Circle extends DisplayObject{
    num _radius;
    Color _color;
    num _strokeThickness;
    Color _stroke;
    Point _center;

    num get radius => _radius;
    set radius(value) {
        _radius = value;
        Resize();
    }

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

    Circle(this._radius, this._color, [this._stroke = null, this._strokeThickness = 0]){

        if(_stroke== null) _stroke = new Color(0);

        Resize();
    }

    @override Resize() {
        _width = 2 * _radius;
        _height = 2 * _radius;
        _center = new Point(_x + _radius, _y + _radius );

        super.Resize();

        _ctx.clearRect(0, 0, _width, _height);
        _ctx.fillStyle = _color.toString();
        _ctx.strokeStyle = _stroke.toString();
        _ctx.lineWidth  = _strokeThickness;
        _ctx.beginPath();
        _ctx.arc(_center.x, _center.y, _radius - _strokeThickness, 0, 2 * PI, false);
        _ctx.closePath();
        _ctx.fill();

        if(_strokeThickness > 0) _ctx.stroke();
    }

}