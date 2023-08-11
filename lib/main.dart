import 'package:cric_score/components/mongo_connect.dart';
import 'package:cric_score/views/constant.dart';
import 'package:cric_score/views/home_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cric Score',
      theme: ThemeData(
        fontFamily: 'REM',
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
