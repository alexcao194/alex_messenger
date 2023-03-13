import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

enum HomePage {
  messages,
  group,
  call,
  online;
  const HomePage();
  factory HomePage.fromValue(int value) {
    switch(value) {
      case 0:
        return HomePage.messages;
      case 1:
        return HomePage.group;
      case 2:
        return HomePage.call;
      default:
        return HomePage.online;
    }
  }

  int get value {
    switch(this) {
      case HomePage.messages:
        return 0;
      case HomePage.group:
        return 1;
      case HomePage.call:
        return 2;
      case HomePage.online:
        return 3;
    }
  }

  String get string {
    String value = toString().split('.').last;
    return String.fromCharCode(value.codeUnits[0] - 32) + value.substring(1);
  }
}

class NavigationCubit extends Cubit<HomePage> {
  NavigationCubit() : super(HomePage.messages);
  void change(HomePage page, {PageController? controller}) {
    if(controller != null) {
      controller.animateToPage(
        page.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linearToEaseOut
      );
    }
    emit(page);
  }
}
