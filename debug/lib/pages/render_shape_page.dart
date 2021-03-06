import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;
import 'package:graphic/src/engine/node.dart';

class RenderShapePage extends StatefulWidget {
  @override
  _RenderShapePageState createState() => _RenderShapePageState();
}

class _RenderShapePageState extends State<RenderShapePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  graphic.Renderer r1 = graphic.Renderer();

  @override
  void initState() {
    super.initState();

    // final arc = r1.addShape(graphic.ArcAttrs(
    //   x: 100,
    //   y: 100,
    //   r: 40,
    //   startAngle: 4,
    //   // strokeWidth: 10,
    //   clockwise: false,
    // ))..props.zIndex = 10;

    // final bbox1 = arc.bbox;
    // r1.addShape(graphic.RectAttrs(
    //   x: bbox1.topLeft.dx,
    //   y: bbox1.topLeft.dy,
    //   width: bbox1.width,
    //   height: bbox1.height,
    //   color: Colors.green,
    // ))..props.zIndex = 1;

    // final rect = r1.addShape(graphic.RectRenderShape(
    //   x: 50,
    //   y: 50,
    //   width: 50,
    //   height: 50,
    //   style: PaintingStyle.stroke,
    //   strokeWidth: 4,
    // ))..state.zIndex = 10;

    // final bbox1 = rect.bbox;
    // r1.addShape(graphic.RectRenderShape(
    //   x: bbox1.topLeft.dx,
    //   y: bbox1.topLeft.dy,
    //   width: bbox1.width,
    //   height: bbox1.height,
    //   color: Colors.green,
    // ))..state.zIndex = 1;

    
    // // rect.translate(x: 50, y: 50);
    // rect.rotate(0.8, origin: Offset(75, 75));
    // // rect.scale(x: 0.5, y: 0.5, origin: Offset(50, 50));

    // final shape = r1.addShape(graphic.CircleAttrs(
    //   x: 10,
    //   y: 10,
    //   r: 10,
    // ))..props.zIndex = 10;

    // final bbox1 = shape.bbox;
    // r1.addShape(graphic.RectAttrs(
    //   x: bbox1.topLeft.dx,
    //   y: bbox1.topLeft.dy,
    //   width: bbox1.width,
    //   height: bbox1.height,
    //   color: Colors.green,
    // ))..props.zIndex = 1;

    // final shape = r1.addShape(graphic.LineAttrs(
    //   x1: 10,
    //   y1: 10,
    //   x2: 100,
    //   y2: 100
    // ))..props.zIndex = 10;

    // final bbox1 = shape.bbox;
    // r1.addShape(graphic.RectAttrs(
    //   x: bbox1.topLeft.dx,
    //   y: bbox1.topLeft.dy,
    //   width: bbox1.width,
    //   height: bbox1.height,
    //   color: Colors.green,
    // ))..props.zIndex = 1;

    // final shape = r1.addShape(graphic.PolylineRenderShapeProps(
    //   points: [
    //     Offset(10, 500),
    //     Offset(50, 600),
    //     Offset(100, 550),
    //     Offset(150, 200),
    //     Offset(200, 400),
    //     Offset(250, 200),
    //     Offset(300, 700),
    //   ],
    //   smooth: true,
    // ))..state.zIndex = 10;

    // final bbox1 = shape.bbox;
    // r1.addShape(graphic.RectRenderShapeProps(
    //   x: bbox1.topLeft.dx,
    //   y: bbox1.topLeft.dy,
    //   width: bbox1.width,
    //   height: bbox1.height,
    //   color: Colors.green,
    // ))..state.zIndex = 1;

    // shape.translate(x: 0, y: 90);

    // final group = r1.addGroup();

    // final rect = group.addShape(graphic.RectRenderShape(
    //   x: 50,
    //   y: 50,
    //   width: 50,
    //   height: 50,
    //   // style: PaintingStyle.stroke,
    //   strokeWidth: 10,
    //   color: Colors.green,
    // ))..state.zIndex = 10;

    // group.addShape(graphic.CircleRenderShape(
    //   x: 50,
    //   y: 50,
    //   r: 2,
    //   color: Colors.red,
    // ))..state.zIndex = 100;

    // group.addShape(graphic.CircleRenderShape(
    //   x: 100,
    //   y: 100,
    //   r: 2,
    //   color: Colors.red,
    // ))..state.zIndex = 100;

    // final path = Path();
    // path.moveTo(50, 50);
    // path.lineTo(100, 50);
    // path.lineTo(100, 100);
    // path.close();

    // r1.addShape(graphic.CustomRenderShape(
    //   path: path,
    //   color: Colors.red,
    // ));

    final points = [
      Offset(10, 100),
      Offset(20, 140),
      Offset(200, 280),
      Offset(280, 140),
    ];

    final rPoints = points.reversed.toList();

    r1.addShape(graphic.PolylineRenderShape(
      points: points,
      smooth: true,
      color: Colors.red,
    ));

    r1.addShape(graphic.PolylineRenderShape(
      points: rPoints,
      smooth: true,
      color: Colors.green,
    ));

    r1.mount(() { setState(() {}); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('RenderShape'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: CustomPaint(
                  painter: r1.painter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
