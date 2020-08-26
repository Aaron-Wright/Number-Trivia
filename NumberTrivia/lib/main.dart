import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'FEATURES/Presentation/Pages/number_trivia_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(Trivia());
}

class Trivia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
      primaryColor: Colors.green.shade500,
      accentColor: Colors.greenAccent.shade400,
      ),
      home: NumberTriviaPage(),
    );
  }
}