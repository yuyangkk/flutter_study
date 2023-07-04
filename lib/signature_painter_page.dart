import 'package:flutter/material.dart';

// 绘图

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset?> points;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class SignaturePage extends StatefulWidget {
  SignaturePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  List<Offset?> _points = <Offset>[];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){ // leading 如果不实现，automaticallyImplyLeading=true,界面被push出来时，会自动加上返回按钮和事件
          Navigator.pop(context, 'hello world');
        }),
      ),
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox referenceBox = context.findRenderObject() as RenderBox;
            Offset localPosition =
            referenceBox.localToGlobal(details.localPosition);
            _points = List.from(_points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
        child: CustomPaint(
          painter: SignaturePainter(_points),
          size: Size.infinite,
        ),
      ),
    );
  }
}
