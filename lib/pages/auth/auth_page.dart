import 'package:desafio_mi/components/app_bar.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Página Auth',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}