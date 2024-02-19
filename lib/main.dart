import 'package:flutter/material.dart';
import 'package:forisa_package/utils/FormatUtil.dart';
// import 'package:forisa_package/configs/config_constants.dart';
// import 'package:forisa_package/forisa_package.dart';
import 'package:forisa_package/utils/AlertUtil.dart';
// import 'package:forisa_package/configs/config_app.dart';
import 'package:forisa_package/widgets/upload_image.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    AlertUtil alertUtil = AlertUtil(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FloatingActionButton(
              onPressed: () {
                print('Button Pressed!');
                // AlertUtil.showSnackbar(ConfigConstant.ALERT_VALIDATION,
                //     ConfigConstant.ALERT_VALIDATION_MSG, AlertStatus.error);
                alertUtil.showResponseDialog(status: DialogStatus.error, content: "AlertUtil");
              },
              child: Text('Press Me'),
            )
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
