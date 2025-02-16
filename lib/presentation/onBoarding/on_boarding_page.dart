import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/dimension.dart';
import 'package:news_app/data/dataSources/local/my_share_pref.dart';
import 'package:news_app/routes/app_router.dart';


class OnBoardingPage extends ConsumerWidget {
  const OnBoardingPage({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body:
        Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: screenHeight * .65,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff2D5BD0),
                        Colors.white
                      ]

                  ),
                    image: DecorationImage(
                        image: AssetImage("assets/on_board.png",),
                        fit: BoxFit.fitHeight),
              ),)
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: screenHeight * .58 - 20,
              child: Container(
                height: screenHeight*.7,
                padding:  EdgeInsets.only(left:Dimension.width10(screenWidth), right: Dimension.width10(screenWidth)),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
                child:Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Get The Latest News And Updates",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xff231F20),
                            fontWeight: FontWeight.w600
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Glob will be right on your hand.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff231F20),
                              fontWeight: FontWeight.w400
                          ),),
                      ),
                          SizedBox(height: 20,),
                      GestureDetector(
                        onTap: ()async{
                         await MySharedPref.setOnBoardingStatus(false);
                          context.go(AppRouter.initial);
                        },
                        child: Container(
                          width: 145,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(128)),
                            color: Color(0xff2D5BD0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Explore",style: TextStyle(color: Colors.white),),
                              Icon(Icons.arrow_forward,color: Colors.white,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //
          ],
        ),

    );
  }
}

