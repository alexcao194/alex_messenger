import 'package:alex_messenger/app/profile/presentation/bloc/user_info/user_info_bloc.dart';
import 'package:alex_messenger/app/profile/presentation/screens/profile_screen.dart';
import 'package:alex_messenger/config/app_paths.dart';
import 'package:alex_messenger/core/services/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({super.key, required this.context}) : super(
    leading: GestureDetector(
      onTap: () {
        BlocProvider.of<UserInfoBloc>(context).add(UserInfoEventGet());
        AppRouter.push(const ProfileScreen());
      },
      child: Image.asset(AppPath.userDefaultFill)
    ),
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
  final BuildContext context;
}
