import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isla_vigu/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:isla_vigu/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:isla_vigu/features/authentication/domain/repositories/auth_repository.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/auth_selection/auth_selection_cubit.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/authentication/authentication_cubit.dart';
import 'package:isla_vigu/features/bedrooms/data/datasources/bed_rooms_remote_datasource.dart';
import 'package:isla_vigu/features/bedrooms/data/repositories/bed_rooms_repository_impl.dart';
import 'package:isla_vigu/features/bedrooms/domain/repositories/bed_rooms_repository.dart';
import 'package:isla_vigu/features/bedrooms/presentation/bloc/bed_rooms_categories/bed_rooms_categories_cubit.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Rememote Datasources
  getIt.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(dio: Dio()),
  );
  getIt.registerFactory<BedRoomsRemoteDatasource>(
    () => BedRoomsRemoteDatasource(),
  );

  // Repositories
  getIt.registerFactory<AuthRepository>(
    () =>
        AuthRepositoryImpl(authRemoteDatasource: getIt<AuthRemoteDatasource>()),
  );
  getIt.registerFactory<BedRoomsRepository>(
    () => BedRoomsRepositoryImpl(
      bedRoomsRemoteDatasource: getIt<BedRoomsRemoteDatasource>(),
    ),
  );

  // Cubits
  getIt.registerFactory<AuthSelectionCubit>(
    () => AuthSelectionCubit(),
  );
  getIt.registerSingleton<AuthenticationCubit>(
    AuthenticationCubit(
      authRepository: getIt<AuthRepository>(),
    ),
  );
  getIt.registerFactory<BedRoomsCategoriesCubit>(
    () => BedRoomsCategoriesCubit(
      bedRoomsRepository: getIt<BedRoomsRepository>(),
    ),
  );
}
