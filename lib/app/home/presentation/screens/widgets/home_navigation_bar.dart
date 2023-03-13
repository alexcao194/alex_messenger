import 'package:alex_messenger/app/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:alex_messenger/app/home/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, HomePage>(
      builder: (context, page) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeNavigationItem(isActive: page == HomePage.messages, page: HomePage.messages),
            HomeNavigationItem(isActive: page == HomePage.group, page: HomePage.group),
            HomeNavigationItem(isActive: page == HomePage.call, page: HomePage.call),
            HomeNavigationItem(isActive: page == HomePage.online, page: HomePage.online)
          ],
        );
      },
    );
  }
}

class HomeNavigationItem extends StatelessWidget {
  const HomeNavigationItem({Key? key, required this.isActive, required this.page}) : super(key: key);

  final HomePage page;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap(context);
      },
      child: Text(
          page.string,
          style: isActive
            ? Theme.of(context).textTheme.subtitle1
            : Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black38)
      ),
    );
  }

  void _onTap(BuildContext context) {
    context.read<NavigationCubit>().change(page, controller: PageControllerHolder.of(context).pageController);
  }
}
