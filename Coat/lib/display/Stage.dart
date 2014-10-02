part of Coat.Display;

class Stage extends DisplayObject {

    Completer _pauseCompleter;

    bool _isPlaying = false;
    Color bgColor;
    Point mouse;
    Function _update;

    CanvasElement get Interactive => _canvas;

    Stage(CanvasElement canvas) : super(canvas) {
        this._id = 'Stage';

        _canvas.onMouseMove.listen((e) => mouse = new Point(e.offset.x, e.offset.y));

    }

    Play(){
        _isPlaying = true;
        window.requestAnimationFrame((e) => Update());
    }

    Future Pause(){
        _isPlaying = false;

        _pauseCompleter = new Completer();
        return _pauseCompleter.future;
    }

    @override SelfUpdate(){

    }

    @override SelfDraw(){

        _ctx.fillStyle= bgColor.toString();
        _ctx.fillRect(_x, _y, _width, _height);

        super.SelfDraw();
    }

    @override Update(){

        if (!_isPlaying) {
            _pauseCompleter.complete();
            return;
        }

        super.Update();

        Draw();

        window.requestAnimationFrame((e) => Update());
    }

}
