import 'package:flutter/material.dart';
import 'package:lokdon_sdk_demo/encrypt_file.dart';
import 'package:lokdon_sdk_demo/encrypt_password.dart';
import 'package:lokdon_sdk_demo/encrypt_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lokdon SDK Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lokdon SDK Demo",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(

            children: const [
              EncryptText(),
              SizedBox(height: 50,),
              EncryptPassword(),
              SizedBox(height: 50,),

              EncryptFile()
            ],
          ),
        ),
      ),
    );
  }
}
