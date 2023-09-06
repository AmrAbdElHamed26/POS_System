import 'package:get_it/get_it.dart';
import 'package:side_proj/admin_module/home_feature/data_layer/data_source/admin_home_remote_data_source.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/repository/base_admin_home_repository.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/use_cases/get_time_and_date_use_case.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_bloc.dart';

import '../admin_module/home_feature/data_layer/repository/admin_home_repository.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    ///blocs
    getIt.registerFactory(() => AdminHomeBloc(getIt()));

    ///DATA SOURCE
    getIt.registerLazySingleton<BaseAdminHomeRemoteDataSource>(() =>AdminHomeRemoteDataSource() );

    ///REPOSITORY
    getIt.registerLazySingleton<BaseAdminHomeRepository>(() =>AdminHomeRepository(getIt()) );

    ///USE CASE
    getIt.registerLazySingleton(() => GetTimeAndDateUsingTimeStampUseCase(getIt()));

  }
}