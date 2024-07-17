import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:sport_app_semicolon/Classes/DrawerClass.dart';

import 'package:sport_app_semicolon/Cubits/PlayersCubit/players_cubit.dart';
import 'package:sport_app_semicolon/Cubits/TeamsCubit/get_teams_cubit.dart';
import 'package:sport_app_semicolon/Functions/DrawerClass.dart';
import 'package:sport_app_semicolon/Screens/CountriesScreen.dart';
import 'package:sport_app_semicolon/Screens/PlayersScreen.dart';
import 'package:sport_app_semicolon/Screens/TeamsScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myDrawer(),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 1 / 15,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xfff0a307),
          title: Text(
            "SPORTS",
            style: GoogleFonts.lato(color: Colors.black, fontSize: 30),
          ),
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            );
          }),
        ),
        body: Container(
          color: Colors.grey[850],
          height: double.infinity,
          width: double.infinity,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: ((MediaQuery.of(context).size.width) /
                (MediaQuery.of(context).size.height -
                    20 -
                    MediaQuery.of(context).size.height * 1 / 15)),
            crossAxisCount: 2,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    FootballCountriesView(),
                              ),
                            );
                          },
                          child: Container(
                            child: Lottie.asset(
                                'assets/lottie_animations/football.json'),
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15),
                            //   shape: BoxShape.rectangle,
                            //   // image: DecorationImage(
                            //   //     image: AssetImage(
                            //   //       "assets/images/football.png",
                            //   //     ),
                            //   //     fit: BoxFit.fill),

                            // ),
                          ),
                        ),
                      ),
                      Text(
                        "Football",
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Not Available yet'),
                                    content: Text('Coming Soon'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            child: Lottie.asset(
                                'assets/lottie_animations/basketball.json'),
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15),
                            //   shape: BoxShape.rectangle,
                            //   image: DecorationImage(
                            //       image: AssetImage(
                            //         "assets/images/basketball.png",
                            //       ),
                            //       fit: BoxFit.fill),
                            // ),
                          ),
                        ),
                      ),
                      Text(
                        "Basketball",
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Not Available yet'),
                                    content: Text('Coming Soon'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            child: Lottie.asset(
                                'assets/lottie_animations/cricket.json'),
                          ),
                        ),
                      ),
                      Text(
                        "Cricket",
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Not Available yet'),
                                      content: Text('Coming Soon'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              child: Lottie.asset(
                                  'assets/lottie_animations/tennis.json'),
                            ),
                          ),
                        ),
                        Text(
                          "Tennis",
                          style: GoogleFonts.lato(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
