import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isla_vigu/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:isla_vigu/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:isla_vigu/features/authentication/domain/repositories/auth_repository.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/auth_selection/auth_selection_cubit.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/authentication/authentication_cubit.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Rememote Datasources
  getIt.registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDatasource(dio: Dio()));

  // Repositories
  getIt.registerFactory<AuthRepository>(() =>
      AuthRepositoryImpl(authRemoteDatasource: getIt<AuthRemoteDatasource>()));

  // Cubits
  getIt.registerFactory(
    () => AuthSelectionCubit(),
  );
  getIt.registerSingleton(
      AuthenticationCubit(authRepository: getIt<AuthRepository>()));
}
