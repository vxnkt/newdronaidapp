import 'package:dronaid_app/screens/OrderDetails.dart';
import 'package:dronaid_app/screens/emergency_page.dart';
import 'package:dronaid_app/screens/fetched_emergency.dart';
import 'package:dronaid_app/screens/home.dart';
import 'package:dronaid_app/screens/home_page2.dart';
import 'package:dronaid_app/screens/login/login.dart';
import 'package:dronaid_app/screens/signUp/signUp.dart';
import '../firebase/firestore_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase/firebase_options.dart';
import 'screens/request_page.dart';
import 'screens/ProfilePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    FetchedEmergency(),
    RequestPage(),
    HomePage2(),
    ProfilePage(),
  ];


  @override
  void initState() {
    super.initState();
    FirestoreMethods().initializeFlags();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: OrderTrackingPage(),
     
      ),
    );
  }
}
