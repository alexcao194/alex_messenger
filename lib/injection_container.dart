import 'package:alex_messenger/app/authentication/data/datasources/remote_data.dart' as ac;
import 'package:alex_messenger/app/authentication/data/datasources/cache_data.dart' as ac;
import 'package:alex_messenger/app/authentication/data/respositories/repositories_impl.dart' as ac;
import 'package:alex_messenger/app/authentication/domain/repositories/repositories.dart' as ac;
import 'package:alex_messenger/app/authentication/domain/usecases/signup.dart' as ac;
import 'package:alex_messenger/app/authentication/domain/usecases/login.dart' as ac;
import 'package:alex_messenger/app/authentication/domain/usecases/get_account.dart' as ac;
import 'package:alex_messenger/app/authentication/presentation/bloc/authentication/authentication_bloc.dart' as ac;
import 'package:alex_messenger/app/authentication/presentation/bloc/account/account_cubit.dart' as ac;
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;


Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ac.AuthenticationBloc(
    signup: sl(),
    login: sl(),
    getAccount: sl()
  ));
  sl.registerFactory(() => ac.AccountCubit(
    getAccount: sl()
  ));

  // Usecase
  sl.registerLazySingleton(() => ac.Signup(repositories: sl()));
  sl.registerLazySingleton(() => ac.Login(repositories: sl()));
  sl.registerLazySingleton(() => ac.GetAccount(repositories: sl()));

  // Repositories
  sl.registerLazySingleton<ac.Repositories>(() => ac.RepositoriesImpl(
    remoteData: sl(),
    cacheData: sl()
  ));

  // Data
  sl.registerLazySingleton<ac.RemoteData>(() => ac.RemoteDataImpl());
  sl.registerLazySingleton<ac.CacheData>(() => ac.CacheDataImpl(sharedPreferences: sl()));

  // 3th service
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}