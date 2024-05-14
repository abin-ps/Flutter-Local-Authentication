import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAuthenticated = false;
  final LocalAuthentication _auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: _authenticate,
        child: Icon(_isAuthenticated ? Icons.lock : Icons.lock_open),
      ),
    );
  }

  void _authenticate() async {
    if (!_isAuthenticated) {
      try {
        //checking is the device has biometrics authentication support.
        final bool hasBiometricsAuthentications = await _auth.canCheckBiometrics;
        //if it has then authenticate
        if (hasBiometricsAuthentications) {
          final bool didAuthenticate = await _auth.authenticate(
              localizedReason: "Please authenticate to show account balance.",
              options: const AuthenticationOptions(
                biometricOnly: false, //if it is true, patterns verifcation not allowed. biometrics only - Face ID or FingerPrint
              ));

          setState(() {
            _isAuthenticated = didAuthenticate;
          });
        }
      } catch (e) {
        print(e);
      }
    } else {
      setState(() {
        _isAuthenticated = !_isAuthenticated;
      });
    }
  }

  Widget _buildUI() {
    const TextStyle defaultTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Account Balance",
            style: defaultTextStyle,
          ),
          if (_isAuthenticated)
            const Text(
              "\$ 87,500",
              style: defaultTextStyle,
            ),
          if (!_isAuthenticated)
            const Text(
              "******",
              style: defaultTextStyle,
            )
        ],
      ),
    );
  }
}
