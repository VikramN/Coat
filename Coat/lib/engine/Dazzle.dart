part of Coat.Engine;

class Dazzle{
    Stage _stage;
    Stage get stage => _stage;

    Setup(CanvasElement canvas)
    {
        _stage = new Stage(canvas);
    }
}
