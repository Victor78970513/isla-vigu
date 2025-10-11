import 'package:get_it/get_it.dart';
import 'package:isla_vigu/features/auth/presentation/bloc/auth_selection/auth_selection_cubit.dart';

final getIt = GetIt.instance;

void initDependencies() {
  _initAuth();
}

void _initAuth() {
  getIt.registerFactory(
    () => AuthSelectionCubit(),
  );
}
