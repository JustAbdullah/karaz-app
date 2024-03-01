// استيراد الحزم اللازمة
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

// تعريف الحالة العالمية للمصادقة ورقم الهاتف
final FirebaseAuth _auth = FirebaseAuth.instance;
String? _phoneNumber;

// تعريف الصفحة الرئيسية التي تحتوي على حقل إدخال رقم الهاتف وزر إرسال otp
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // تعريف متحكم النص لحقل إدخال رقم الهاتف
  final TextEditingController _phoneController = TextEditingController();

  // تعريف الدالة التي ترسل otp إلى رقم الهاتف المدخل
  void _sendOtp() async {
    // تحديد رقم الهاتف من متحكم النص
    _phoneNumber = _phoneController.text.trim();

    // التحقق من صحة رقم الهاتف
    if (_phoneNumber!.isEmpty || _phoneNumber!.length != 9) {
      // إظهار رسالة خطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid 10-digit phone number'),
        ),
      );
      return;
    }

    // إضافة رمز البلد إلى رقم الهاتف
    _phoneNumber = '+967' + _phoneNumber!;

    // محاولة إرسال otp باستخدام firebase auth
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // هذه الدالة تستدعى عندما يتم التحقق من otp تلقائيا
          // يمكنك تسجيل الدخول بواسطة الاعتماد أو التنقل إلى صفحة أخرى
        },
        verificationFailed: (FirebaseAuthException e) {
          // هذه الدالة تستدعى عندما يفشل إرسال otp
          // يمكنك إظهار رسالة خطأ أو إعادة المحاولة
        },
        codeSent: (String? verificationId, int? resendToken) {
          // هذه الدالة تستدعى عندما يتم إرسال otp بنجاح
          // يمكنك التنقل إلى صفحة التحقق من otp وتمرير verificationId
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpPage(verificationId: verificationId!),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // هذه الدالة تستدعى عندما ينتهي وقت otp
          // يمكنك إعادة إرسال otp أو إلغاء العملية
        },
      );
    } catch (e) {
      // التعامل مع أي استثناءات أخرى
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // حقل إدخال رقم الهاتف
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                prefixText: '+967',
              ),
            ),
            // زر إرسال otp
            ElevatedButton(
              child: Text('Send OTP'),
              onPressed: _sendOtp,
            ),
          ],
        ),
      ),
    );
  }
}

// تعريف الصفحة التي تحتوي على حقل إدخال otp وزر التحقق
class OtpPage extends StatefulWidget {
  // تعريف معرف التحقق الذي تم تمريره من الصفحة الرئيسية
  String? verificationId;

  // استخدام البناء التمهيدي لتعيين معرف التحقق
  OtpPage({@required this.verificationId});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // تعريف متحكم النص لحقل إدخال otp
  final TextEditingController _otpController = TextEditingController();

  // تعريف الدالة التي تتحقق من otp باستخدام firebase auth
  void _verifyOtp() async {
    // تحديد otp من متحكم النص
    String otp = _otpController.text.trim();

    // التحقق من صحة otp
    if (otp.isEmpty || otp.length != 6) {
      // إظهار رسالة خطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid 6-digit OTP'),
        ),
      );
      return;
    }

    // إنشاء اعتماد المصادقة باستخدام otp ومعرف التحقق
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId!,
      smsCode: otp,
    );

    // محاولة تسجيل الدخول باستخدام الاعتماد
    try {
      // تسجيل الدخول باستخدام الاعتماد
      await _auth.signInWithCredential(credential);

      // إظهار رسالة نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You have successfully logged in'),
        ),
      );

      // التنقل إلى صفحة أخرى أو القيام بأي عمل آخر
    } on FirebaseAuthException catch (e) {
      // التعامل مع أي استثناءات أخرى
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // حقل إدخال otp
            PinInputTextField(
              controller: _otpController,
              pinLength: 6,
              keyboardType: TextInputType.number,
              decoration: BoxLooseDecoration(
                strokeColorBuilder: PinListenColorBuilder(
                  Colors.blue,
                  Colors.grey,
                ),
              ),
            ),
            // زر التحقق
            ElevatedButton(
              child: Text('Verify'),
              onPressed: _verifyOtp,
            ),
          ],
        ),
      ),
    );
  }
}
