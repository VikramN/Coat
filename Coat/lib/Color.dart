part of Coat;

class Color {
    int color;
    double alpha;

    Color(this.color, [this.alpha = 1.0]);

    @override toString(){
        var r = (color & 0xFF0000) >> 16;
        var g = (color & 0xFF00) >> 8;
        var b = (color & 0xFF);
        return 'rgba( $r , $g , $b , $alpha)';
    }
}