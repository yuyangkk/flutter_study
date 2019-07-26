import 'package:flutter/material.dart';

class FadeAnimationPage extends StatefulWidget {
  FadeAnimationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FadeAnimationPageState createState() => _FadeAnimationPageState();
}

class _FadeAnimationPageState extends State<FadeAnimationPage> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.forward();
        },
        tooltip: 'fade',
        child: Icon(Icons.brush),
      ),
    );
  }

//  void pushSignature(BuildContext context) async{
//    String backData = await Navigator.of(context).pushNamed('signature');
//    String backData = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignaturePage(title:'signatures')));
//    print(backData);
//  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
