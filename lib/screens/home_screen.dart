import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todquest_assignment/screens/screen_1.dart';
import 'package:todquest_assignment/screens/user_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 1,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image
                      .asset(
                    'images/wallpaper.png',
                  )
                      .image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Todquest \nEnterprises',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 8,
                            fontWeight: FontWeight.w600
                        )
                    ),
                  ),
                  SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, MediaQuery.of(context).size.width / 24, 0, 0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screen1(),
                                )
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  // blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width / 6,
                            child: Center(
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xff030F1B),
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.width / 22,
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 22,),
                      Text(
                        'By Anurag Kainth',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width / 16,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ),
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}