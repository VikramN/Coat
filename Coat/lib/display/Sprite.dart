part of Coat.Display;

class Sprite extends DisplayObject {
    ImageElement img;
    bool isImageLoaded = false;


    Sprite.FromUrl(String url){
        img = new ImageElement();
        img.onLoad.listen((e){
            isImageLoaded = true;
            _redraw = true;
        });

        img.src = url;
    }

    @override SelfDraw(){
        if (!isImageLoaded) return;

        _ctx
            ..clearRect(0, 0, width, height)
            ..drawImageScaled(img, 0, 0, width, height);

        super.SelfDraw();
    }

}