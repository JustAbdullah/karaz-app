import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:karaz/views/HomeScreen/home_screen.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<void> _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+967${_phoneController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        // TODO: Handle successful sign in
      },
      verificationFailed: (FirebaseAuthException e) {
        // TODO: Handle failed verification
      },
      codeSent: (String? verificationId, int? resendToken) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Enter OTP'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _codeController,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Confirm'),
                  onPressed: () async {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId!,
                            smsCode: _codeController.text.trim());
                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) async {
                      if (value.user != null) {
                        // TODO: Handle successful sign in
                        Get.to(HomeScreen());
                      }
                    });
                  },
                )
              ],
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // TODO: Handle auto-retrieval timeout
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Phone Number (+xx xxx-xxx-xxxx)',
            ),
            controller: _phoneController,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              _verifyPhoneNumber();
            },
            child: Text('Verify'),
          ),
        ],
      ),
    );
  }
}
