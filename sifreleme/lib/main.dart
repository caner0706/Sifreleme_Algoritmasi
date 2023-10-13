import 'package:flutter/material.dart';
import 'input_page.dart';

void main(){
  runApp(Sifreleme());
}

class Sifreleme extends StatelessWidget {
  const Sifreleme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}