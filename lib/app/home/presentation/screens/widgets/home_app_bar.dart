import 'package:alex_messenger/config/app_paths.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({super.key}) : super(
    leading: Image.asset(AppPath.userDefaultFill),
    title: Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search, color: Colors.blue),
                onPressed: () {

                },
              )
            )
        ),
      ),
    ),
  );
}
