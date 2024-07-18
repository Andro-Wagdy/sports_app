import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/Cubits/Circular_Indicator_Cubit/circular_indicator_cubit.dart';
import 'package:sports_app/Screens/HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  RegExp phone_number_regex = RegExp(r'^01[0-9]{9}$');

  RegExp otp_code_regex = RegExp(r"^[0-9]{4}$");

  var otp_code;

  var random_otp;

  var phone_number;

  // RegExp email_regex =
  //     new RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+[a-zA-Z0-9.-]+\.com\${0,}");

  // RegExp user_name_regex = new RegExp(r"^([A-Z]+[ a-zA-Z0-9._%+-]{9,})$");

  // RegExp password_regex = new RegExp(
  //     r"(?=^.{9,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$");

  bool? backCase;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[850],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(color: Color(0xfff0a307), fontSize: 45),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 20,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    validator: (value) {
                      // print("Phone number is : ${value}");
                      // phone_number = value.toString();
                      // final prefs =
                      if (phone_number_regex.hasMatch(value!) == false) {
                        return 'Invalid Phone number';
                      } else {
                        phone_number = value;
                        return null;
                      }
                    },
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red[400]),
                        contentPadding: const EdgeInsets.all(15),
                        prefixIcon: const Icon(Icons.phone,
                            color: Color.fromARGB(255, 145, 142, 142),
                            size: 30),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        hintText: 'Phone number',
                        hintStyle: const TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),

                  width: MediaQuery.of(context).size.width * 0.8,
                  // height: MediaQuery.of(context).size.height * 0.65,
                  child: TextFormField(
                      onChanged: (text) {
                        otp_code = text;
                      },
                      validator: (value) {
                        if (otp_code_regex.hasMatch(value!) == false) {
                          return ('invalid verification Code');
                        }
                        if (otp_code != random_otp.toString()) {
                          return 'Wrong Code';
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red[400]),
                        contentPadding: const EdgeInsets.all(15),
                        prefixIcon: const Icon(Icons.verified_user,
                            color: Color.fromARGB(255, 145, 142, 142),
                            size: 30),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        hintText: 'verification Code',
                        hintStyle: const TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 1 / 20),
                BlocBuilder<CircularIndicatorCubit, CircularIndicatorState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate() &&
                            otp_code == random_otp.toString()) {
                          context.read<CircularIndicatorCubit>().Circular();
                          await Future.delayed(const Duration(seconds: 3));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => HomeScreen(),
                            ),
                          );
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('phone_logedin', true);
                          prefs.setBool('google_logedin', false);
                          prefs.setString('phone_number', phone_number);
                          // print(phone_number);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          elevation: 10,
                          backgroundColor: Colors.green[500],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                          )),
                      child: context.read<CircularIndicatorCubit>().isLoading
                          ? const SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Please Wait...',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          : const Text(
                              'verifying',
                              style: TextStyle(color: Colors.black),
                            ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    var random = Random();
                    var tempOtp = random.nextInt(8) + 1;
                    random_otp = random.nextInt(1000) + (1000 * tempOtp);
                    // print(random_otp);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'verification Code',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                    'You should copy this number and write it in the verification code place'),
                                Text(
                                  random_otp.toString(),
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              child: const Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      elevation: 10,
                      backgroundColor: const Color(0xfff0a307),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )),
                  child: const Text(
                    'Generate Verification Code',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FloatingActionButton.extended(
                  onPressed: () async {
                    await signingWithGoogle();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  icon: Lottie.asset(
                    'assets/lottie_animations/google.json',
                    height: 70,
                    width: 70,
                  ),
                  label: const Text('Sign in with Google'),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> signingWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential userCredential =
        await _auth.signInWithCredential(authCredential);

    User? user = userCredential.user;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('google_logedin', true);
    prefs.setBool('phone_logedin', false);
    // print(user?.displayName);
    String? googleName = user!.displayName;
    String? googlePhoto = user.photoURL;
    String? googleEmail = user.email;
    String? googleNumber = user.phoneNumber;
    prefs.setString('google_name', googleName.toString());
    prefs.setString('google_photo', googlePhoto.toString());
    prefs.setString('google_email', googleEmail.toString());
    prefs.setString('google_number', googleNumber.toString());
  }
}
