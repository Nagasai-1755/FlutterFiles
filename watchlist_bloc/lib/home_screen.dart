import 'package:flutter/material.dart';
import 'package:watchlist_bloc/contact_list_page.dart';
import 'package:watchlist_bloc/string/string_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 197, 196, 193),
            title: const Text(StringNames.textOne),
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
             color: Colors.black),
             bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              tabs: [
                Tab(child: Text(StringNames.textTwo)),
                Tab(child: Text(StringNames.textThree)),
                Tab(child: Text(StringNames.textFour)),
                Tab(child: Text(StringNames.textFive)),
                Tab(child: Text(StringNames.textSix)),
              ],
             ),
          ),
          body: const TabBarView(children: [
            ContactListPage(startId: 1, endId: 20),
            ContactListPage(startId: 21, endId: 40),
            ContactListPage(startId: 41, endId: 60),
            ContactListPage(startId: 61, endId: 80),
            ContactListPage(startId: 81, endId: 100)
          ]),
        ),
      ),
    );
  }
}
