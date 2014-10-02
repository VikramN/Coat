part of Coat.Display;

class DisplayObject {
    CanvasElement _canvas;
    CanvasRenderingContext2D _ctx;
    Rectangle _bounds;
    bool _redraw = true;
    String _id;

    DisplayObject parent;

    final List<DisplayObject> _children = [];
    final List<DisplayObject> _childrenToAdd = [];
    final List<DisplayObject> _childrenToRemove = [];

    num     _x,
            _y,
            _width,
            _height,
            _rotation = 0;

    Point _scale = new Point(1, 1);

    get Children => _children;
    get Bounds => _bounds;
    CanvasRenderingContext2D get Context => _ctx;
    get x => _x;
    get y => _y;
    get width => _width;
    get height => _height;
    get rotation => _rotation * 180 / PI;
    get scale => _scale;
    get alpha => _ctx.globalAlpha;
    get ID => _id;
    get Redraw => _redraw || _children.any((x) => x.Redraw);

    set x(value) {
        _x = value;
        Resize();
    }
    set y(value) {
        _y = value;
        Resize();
    }
    set width(value) {
        _width = value;
        Resize();
    }
    set height(value) {
        _height = value;
        Resize();
    }
    set rotation(value) {
        _rotation = value * PI / 180;
        Resize();
    }
    set scale(value) {
        _scale = value;
        Resize();
    }
    set alpha(num value) {
        _ctx.globalAlpha = value;
        _redraw = true;
    }

    set ID(value) => _id = value;

    set Redraw(bool value) {
        _redraw = value;
    }

    DisplayObject([this._canvas = null]) {

        if (_canvas == null) _canvas = new CanvasElement();

        _ctx = _canvas.context2D;
        _x = _y = 0;
        _width = _canvas.width;
        _height = _canvas.height;
    }

    AddChild(DisplayObject child, [bool immidiate = false]){
        child.parent = this;

        if(immidiate) {
            _children.add(child);
        } else {
            _childrenToAdd.add(child);
        }
    }

    RemoveChild(DisplayObject child, [bool immidiate = false]){
        child.parent = null;

        if(immidiate) {
            _children.remove(child);
        } else {
            _childrenToRemove.add(child);
        }
    }

    SelfUpdate() {}

    SelfDraw() {
        _redraw = false;
    }

    Update() {
        SelfUpdate();

        _children.forEach((x) {
            x.Update();
        });

        _children.addAll(_childrenToAdd);
        _childrenToAdd.clear();

        _childrenToRemove.forEach((x) => _children.remove(x));
        _childrenToRemove.clear();
    }

    Draw() {


        var redrawAll = Redraw;

        if (!redrawAll) {
            return;
        }

        SelfDraw();

        _children.forEach((x) {
            x.Draw();
        });

        _children.forEach((child) {
            _ctx.save();
            var hw = child._width / 2, hh = child._height / 2;
            _ctx.translate(child.x + hw, child.y + hh);
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
        _redraw = true;
    }
}
