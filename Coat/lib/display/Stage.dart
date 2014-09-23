part of Coat.Display;

class Stage extends DisplayObject {

    Color bgColor;

    Stage(CanvasElement canvas) : super(canvas) {
        print("Stage created");
        window.requestAnimationFrame((e) => Update());
    }

    Update(){
        Draw();
        window.requestAnimationFrame((e) => Update());
    }

    @override Draw(){
        _ctx.fillStyle= bgColor.toString();
        _ctx.fillRect(_x, _y, _width, _height);

        super.Draw();
    }
}
