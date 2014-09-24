part of Coat.Display;

class DisplayObject {
    CanvasElement _canvas;
    CanvasRenderingContext2D _ctx;
    Rectangle _bounds;
    
    DisplayObject parent;

    final List<DisplayObject> _children = [];

    get Children => _children;
    get Bounds => _bounds;

    num _x, _y, _width, _height, _rotation = 0;
    Point _scale = new Point(1, 1);

    get x => _x;
    get y => _y;
    get width => _width;
    get height => _height;
    get rotation => _rotation * 180 / PI;
    get scale => _scale;

    set x(value) { _x = value; Resize(); }
    set y(value) { _y = value; Resize(); }
    set width(value) { _width = value; Resize(); }
    set height(value) { _height = value; Resize(); }
    set rotation(value) { _rotation = value * PI / 180; Resize(); }
    set scale(value) { _scale = value; Resize();}

    DisplayObject([this._canvas = null]) {

        if (_canvas == null) _canvas = new CanvasElement();

        _ctx = _canvas.context2D;
        _x = _y = 0;
        _width = _canvas.width;
        _height = _canvas.height;

    }

    AddChild(DisplayObject child) {
        child.parent = this;
        _children.add(child);
    }

    AddChildAt(int index, DisplayObject child) {
        child.parent = this;
        _children.insert(index, child);
    }

    Draw() {
        _children.forEach((x) {
            x.Draw();
        });

        _children.forEach((child) {
            _ctx.save();
            var hw = child._width/ 2, hh = child._height/2;
            _ctx.translate(child.x + hw, child.y +  hh);
            _ctx.scale(child.scale.x, child.scale.y);
            _ctx.rotate(child._rotation);
            _ctx.drawImage(child._canvas, -hw, -hh);
            _ctx.restore();
        });
    }

    void Resize() {
        _bounds = new Rectangle(_x, _y, _width, _height);
        _canvas.width = _width;
        _canvas.height = _height;
   }
}
