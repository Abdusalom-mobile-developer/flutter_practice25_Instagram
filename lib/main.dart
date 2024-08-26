import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_practice25_instagram/pages/favorite_page.dart';
import 'package:flutter_practice25_instagram/pages/home_page.dart';
import 'package:flutter_practice25_instagram/pages/profile_page.dart';
import 'package:flutter_practice25_instagram/pages/search_page.dart';
import 'package:flutter_practice25_instagram/pages/upload_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final listofPages = [
    HomePage(),
    SearchPage(),
    UploadPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: Icon(Icons.camera_alt_outlined),
        title: Text(
          "Instagram",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(FeatherIcons.tv),
          SizedBox(
            width: 15,
          ),
          Icon(FeatherIcons.send),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: listofPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: "Upload"),
            BottomNavigationBarItem(
                icon: _currentIndex == 3
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: _currentIndex == 4
                    ? Icon(Icons.person)
                    : Icon(Icons.person_outline),
                label: "Profile")
          ]),
    ),
      routes: {
        HomePage.id: (context) => HomePage(),
        SearchPage.id: (context) => SearchPage(),
        UploadPage.id: (context) => UploadPage(),
        FavoritePage.id: (context) => FavoritePage(),
        ProfilePage.id: (context) => ProfilePage(),
      },
    );
  }
}



