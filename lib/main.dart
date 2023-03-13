import 'package:alex_messenger/app/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:alex_messenger/app/home/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:alex_messenger/core/services/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:alex_messenger/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await di.init();
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => NavigationCubit()),
            BlocProvider(create: (_) => di.sl<AuthenticationBloc>()),
          ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alex Messenger',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: AppRouter.navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}


