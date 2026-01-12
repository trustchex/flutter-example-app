import 'package:flutter/material.dart';
import 'package:trustchex_flutter_sdk/trustchex_flutter_sdk.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrustchexView(
        baseUrl: 'https://app.trustchex.com',
        sessionId: '',
        onCompleted: () {
          // Verification completed
        },
        onError: (error) {
          // Verification error
        },
      ),
    );
  }
}
