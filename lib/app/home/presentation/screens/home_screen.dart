import 'package:alex_messenger/app/home/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:alex_messenger/app/home/presentation/screens/pages/message_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/home_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(context: context),
      body: PageControllerHolder(
        pageController: pageController,
        child: Builder(
          builder: (buildContext) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: HomeNavigationBar(),
                ),
                Expanded(
                  child: PageView(
                    onPageChanged: (position) {
                      buildContext.read<NavigationCubit>().change(HomePage.fromValue(position));
                    },
                    controller: PageControllerHolder.of(buildContext).pageController,
                    children: [
                      const MessagePage(),
                      Container(color: Colors.blue),
                      Container(color: Colors.green),
                      Container(color: Colors.yellow),
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}


class PageControllerHolder extends InheritedWidget {
  const PageControllerHolder({super.key, required super.child, required this.pageController});
  final PageController pageController;

  static PageControllerHolder? _maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PageControllerHolder>();
  }

  static PageControllerHolder of(BuildContext context) {
    final PageControllerHolder? result = _maybeOf(context);
    assert(result != null, 'No PageControllerHolder found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant PageControllerHolder oldWidget) {
    return oldWidget.pageController.page != pageController.page;
  }
}



