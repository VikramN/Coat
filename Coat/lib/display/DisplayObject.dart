part of Coat.Display;

class DisplayObject {
    CanvasElement _canvas;
    CanvasRenderingContext2D _ctx;
    Rectangle _bounds;

    DisplayObject parent;

    final List<DisplayObject> _children = [];

    get Children => _children;
    get Bounds => _bounds;

    num _x, _y, _width, _height;

    get x => _x;
    get y => _y;
    get width => _width;
    get height => _height;

    set x(value) { _x = value; Resize(); }
    set y(value) { _y = value; Resize(); }
    set width(value) { _width = value; Resize(); }
    set height(value) { _height = value; Resize(); }

    DisplayObject([this._canvas = null]) {

        if (_canvas == null) _canvas = new CanvasElement();

        _ctx = _canvas.context2D;
        _x = _y = 0;
        _width = _canvas.width;
        _height = _canvas.height;

//        Resize();
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
            _ctx.drawImage(child._canvas, child._bounds.left, child._bounds.top);
        });
    }

    void Resize() {
        _bounds = new Rectangle(_x, _y, _width, _height);
        _canvas.width = _width;
        _canvas.height = _height;
   }
}
