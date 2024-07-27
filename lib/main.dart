import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Control you Lights';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool value = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                value ? 'assets/on.png' : 'assets/off.png',
                height: 300,
              ),
              Spacer(),
              // buildPlatforms(),
              const SizedBox(height: 12),
              buildHeader(
                text: 'Switch',
                child: buildSwitch(),
              ),
              const SizedBox(height: 12),
              //buildHeader(
              //text: 'Android Image',
              //child: buildSpecialAndroidSwitch(),
              // ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      );

  Widget buildHeader({
    required Widget child,
    required String text,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );

  Widget buildSwitch() => Transform.scale(
        scale: 2,
        child: Switch.adaptive(
          thumbColor: MaterialStateProperty.all(Colors.green),
          trackColor: MaterialStateProperty.all(Colors.black45),

          // activeColor: Colors.blueAccent,
          // activeTrackColor: Colors.blue.withOpacity(0.4),
          // inactiveThumbColor: Colors.orange,
          // inactiveTrackColor: Colors.black87,
          splashRadius: 50,
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );

  Widget buildIOSSwitch() => Transform.scale(
        scale: 1.1,
        child: CupertinoSwitch(
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );

  Widget buildAndroidSwitch() => Transform.scale(
        scale: 2,
        child: Switch(
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );

  Widget buildSpecialAndroidSwitch() => Transform.scale(
        scale: 2,
        child: SizedBox(
          width: 75,
          child: Switch(
            trackColor: MaterialStateProperty.all(Colors.black38),

            // thumb colors
            activeColor: Colors.green.withOpacity(0.4),
            inactiveThumbColor: Colors.red.withOpacity(0.4),

            activeThumbImage: AssetImage('assets/thumbs_up.png'),
            inactiveThumbImage: AssetImage('assets/thumbs_down.png'),
            value: value,
            onChanged: (value) => setState(() => this.value = value),
          ),
        ),
      );
}
