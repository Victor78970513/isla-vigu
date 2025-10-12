import 'package:get_it/get_it.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/auth_selection/auth_selection_cubit.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/authentication/authentication_cubit.dart';

final getIt = GetIt.instance;

void initDependencies() {
  _initAuth();
}

void initRepositories() {}

void _initAuth() {
  getIt.registerFactory(
    () => AuthSelectionCubit(),
  );

  getIt.registerSingleton(
    () => AuthenticationCubit(authRepository: authRepository),
  );
}
