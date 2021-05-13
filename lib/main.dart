import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
          child: InkWell(
        onTap: () => Navigator.of(context).push(_createRoute()),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.yellow]),
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      )),
    );
  }
}

//Creating route function for animation
Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, aimation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: aimation.drive(tween),
          child: child,
        );
      });
}

//Secod page to navigate
class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.yellow,
                    Colors.green,
                  ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 2.0,
                  offset: Offset(0.0, 1.0),
                )
              ],
            )),
      ),
    );
  }
}
