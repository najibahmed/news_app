// presentation/views/home/widgets/custom_sliver_app_bar.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/utils/dimension.dart';
import 'package:news_app/presentation/widgets/big_text.dart';
import 'package:news_app/presentation/widgets/small_text.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return SliverAppBar(
      floating: true,
      expandedHeight: Dimension.appBarHeight(screenHeight),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 18,right: 18,top: 60),
            decoration: const BoxDecoration(
              color: Color(0xffE9EEFA),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: "Good Morning,\nTrung",size: 14,color: const Color(0xff6D6265),),
                    BigText(text: DateFormat('MMM d, yyyy').format(DateTime.now()),size: 18,)
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Icon(Icons.sunny,color: Colors.orange,),
                      SizedBox(width: 5,),
                      SmallText(text: "Sunny 32oC",size: 14,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
