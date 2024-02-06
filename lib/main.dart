import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:karaz/views/HomeScreen/home_screen.dart';
import 'core/constant/color_primary.dart';
import 'core/localization/changelanguage.dart';
import 'core/localization/translation.dart';
import 'core/services/appservices.dart';
import 'firebase_options.dart';
import 'views/Auth/sign_screen.dart';
import 'views/Language/choose_language.dart';
import 'views/OnBoardinScreen/onboarding.dart';
import 'views/WelcomeScreen/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initialServices();
// ...

  /////////////////////////////////////////Messagesin..............///////////
  FirebaseMessaging.instance.subscribeToTopic("all");

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  // Stripe.publishableKey = ApiKeysStripe.Publishablekey;

  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

ChangeLanguageToLocale chagnelangcontroller = Get.put(ChangeLanguageToLocale());

class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final width;
  const MyApp({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.restoreSystemUIOverlays();
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window.physicalSize.height;
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window.physicalSize.width;

    return GetMaterialApp(
      //  initialBinding: initBindings(),
      debugShowCheckedModeBanner: false,
      locale: chagnelangcontroller.language,
      translations: AppTranslation(),
      title: "Karaz",
      home: const Scaffold(
          body: SafeArea(
              child: ScreenUtilInit(
                  designSize: Size(360, 690), child: OnBoarding()))),
      theme: ThemeData(primarySwatch: ModeColor.mode),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        // ignore: deprecated_member_use
        final scale = mediaQueryData.textScaleFactor.clamp(0.9, 0.9);
        return MediaQuery(
            // ignore: deprecated_member_use
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: child!);
      },
    );
  }
}
