
import 'package:flutter/material.dart';
import 'package:news_app/presentation/views/home/widgets/custom_bottom_nav.dart';
import '../archive/archive_tab.dart';
import '../explore/explore_tab.dart';
import '../profile/profile_tab.dart';
import 'home_tab.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final _pages = [
    const HomeTab(),
    const ExploreTab(),
    const ArchiveTab(),
    const ProfileTab()
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) => onTapped(index),
      ),
    );
  }
}