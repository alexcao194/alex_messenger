import 'package:alex_messenger/app/profile/presentation/bloc/user_info/user_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocBuilder<UserInfoBloc, UserInfoState>(
              builder: (context, userState) {
                if(userState is UserInfoStateSuccessful) {
                  return Center(
                    child: Text(userState.userInfo.displayName),
                  );
                }
                if(userState is UserInfoStateLoading) {
                  return Center(
                    child: Container(
                      color: Colors.white60,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }
                if(userState is UserInfoStateFail) {
                  return Center(
                    child: Text(userState.message),
                  );
                }
                return const Center(
                  child: Text('error'),
                );
              },
            )
        )
    );
  }
}
