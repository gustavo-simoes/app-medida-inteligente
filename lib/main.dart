import 'package:desafio_mi/components/app_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './config/app_theme.dart';
import 'models/gas_station_change_notifier_model/gas_station_change_notifier_model.dart';
import 'routes.dart';

// Debub erros
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  /*
    Informar ao serviço terceiro Sentry 
    caso o app crashe.
  */
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://1aedebdd21ed41448533213685e2126d@o825152.ingest.sentry.io/5811079';
    },
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => GasStationChangeNotifierModel()),
      ],
      child: MaterialApp(
        title: 'Medida Inteligente',
        themeMode: ThemeMode.light,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        initialRoute: '/',
        routes: routes,

        // Desabilitando bunner "debug"
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
    return Scaffold(
      appBar: AppBarComponent(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button'),
              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
