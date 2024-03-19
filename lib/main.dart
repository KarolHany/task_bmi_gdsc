import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_bmi_gdsc/provider/counters.dart';
import 'package:task_bmi_gdsc/screens/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Counters(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
