import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(child: Text('Hello Drawer')),
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    )),
                ListTile(
                  title: Text('About Us'),
                  autofocus: true,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(pageBuilder());
                  },
                ),
                ListTile(
                  title: Text('Contact Us'),
                  autofocus: false,
                  // onTap: () {
                  //   Navigator.of(context).push(pageBuilder());
                  // },
                  onTap: () => Navigator.pop(context),
                )
              ],
            ),
          ),
          body: Center(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=9',
            ),
          ),
        ),
      ),
    );
  }
}

Route pageBuilder() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
    return AboutUs();
  }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
    var begin = Offset(1.0, 1.0);
    var end = Offset.zero;
    var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  });
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('About Us'),
    );
  }
}
