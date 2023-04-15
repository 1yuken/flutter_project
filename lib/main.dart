import 'package:flutter/material.dart';
import 'package:flutter_project/ui/screens/food_detail_screen.dart';
import 'package:flutter_project/ui/screens/home_screen.dart';
import 'package:flutter_project/ui/screens/profile_screen.dart';
import 'package:flutter_project/ui_kit/app_icon.dart';
import 'package:flutter_project/ui_kit/app_assets.dart';
import 'package:flutter_project/ui_kit/app_theme.dart';
import 'package:flutter_project/ui_kit/app_text_style.dart';
import 'package:flutter_project/ui/screens/food_list_screen.dart';
import 'package:flutter_project/ui/screens/cart_screen.dart';
import 'package:flutter_project/ui/screens/favorite_screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Japan Eat',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: AppTextStyle.h1Style,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset(AppAsset.profileImage),
            Icon(
              AppIcon.heart,
              color: Theme.of(context).indicatorColor,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
