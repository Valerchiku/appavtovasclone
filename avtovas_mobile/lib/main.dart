import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> routes = [
    'Алатырь',
    'Ардатов'
  ];
  String from = 'Алатырь';
  String to = 'Ардатов';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 29,
          vertical: 57,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('./assets/images/background.png')
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 270.25,
              height: 138.38
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Билеты на автобусы\nЧувашии',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    )
                  )
                ]
              )
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFFDFDFDF),
            width: 1
          ),
          borderRadius: BorderRadius.circular(100)
        ),
        onPressed: () {
          // TODO
        },
        child: ImageIcon(
          AssetImage(
              'assets/images/toggle.png'
          ),
          color: Color(0xFF006455)
        ),
        backgroundColor: Colors.white
      )
    );
  }
}
