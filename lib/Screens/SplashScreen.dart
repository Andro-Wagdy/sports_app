import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/Screens/HomeScreen.dart';
import 'package:sports_app/Screens/LoginScreen.dart';
import 'OnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

bool logedin = false; /////////

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<bool> getPrefs() async {
      final prefs = await SharedPreferences.getInstance();
      bool? showHome = prefs.getBool('showHome') ?? false;

      bool? googleLogedin = prefs.getBool('google_logedin') ?? false;

      bool? phoneLogedin = prefs.getBool('phone_logedin') ?? false;

      if (googleLogedin == true || phoneLogedin == true) {
        logedin = true;
      }

      print("/*/**/*//*/***//****/$logedin");

      // showHome = prefs.getBool('showHome');
      return showHome ?? false;
    }

    Future.delayed(const Duration(seconds: 5), () async {
      bool? showHome = await getPrefs();
      Navigator.pushReplacement(
        context,
        //   MaterialPageRoute(
        //     builder: (context) => HomeScreen(),
        //   ),
        // );
        MaterialPageRoute(
            builder: (context) => showHome
                ? (logedin ? HomeScreen() : LoginScreen())
                : OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // الصورة الخلفية
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[850],
          ),

          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.66,
              child: Image.asset("assets/Images/logo.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Developed By Semicolon Team",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
