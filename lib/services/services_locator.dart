import 'package:get_it/get_it.dart';
import 'package:side_proj/admin_module/home_feature/data_layer/data_source/admin_home_remote_data_source.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/repository/base_admin_home_repository.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/use_cases/get_all_notes_use_case.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/use_cases/get_name_use_case.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/use_cases/get_time_and_date_use_case.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_bloc.dart';
import 'package:side_proj/admin_module/notes-feature/data_layer/data_source/admin_notes_remote_data_source.dart';
import 'package:side_proj/admin_module/notes-feature/data_layer/repository/admin_notes_repository.dart';
import 'package:side_proj/admin_module/notes-feature/domain_layer/use_cases/add_note_use_case.dart';
import 'package:side_proj/admin_module/presentation_layer/controller/admin_bloc.dart';
import 'package:side_proj/services/fire_store_functions.dart';
import 'package:side_proj/services/save_data.dart';

import '../admin_module/home_feature/data_layer/repository/admin_home_repository.dart';
import '../admin_module/home_feature/domain_layer/use_cases/get_all_to_do_list_use_case.dart';
import '../admin_module/notes-feature/domain_layer/repository/base_admin_notes_repository.dart';
import '../admin_module/notes-feature/presentaion_layer/controller/admin_notes_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
    void init() {
        /// fireStore
        getIt.registerFactory(() => FireStoreFunctions());



        ///blocs
        getIt.registerFactory(() => AdminHomeBloc(getIt() , getIt() , getIt() , getIt()));
        getIt.registerFactory(() => AdminBloc());
        getIt.registerLazySingleton<AdminNotesBloc>(()=>AdminNotesBloc(getIt()));

        ///DATA SOURCE
        getIt.registerLazySingleton<BaseAdminHomeRemoteDataSource>(() =>AdminHomeRemoteDataSource() );

        getIt.registerLazySingleton<BaseAdminNotesRemoteDataSource>(() =>AdminNotesRemoteDataSource() );

        ///REPOSITORY
        getIt.registerLazySingleton<BaseAdminHomeRepository>(() =>AdminHomeRepository(getIt()) );

        getIt.registerLazySingleton<BaseAdminNotesRepository>(() =>AdminNotesRepository(getIt()));

        ///USE CASE
        getIt.registerLazySingleton(() => GetTimeAndDateUsingTimeStampUseCase(getIt()));
        getIt.registerLazySingleton(() => GetUserNameUseCase(getIt()));
        getIt.registerLazySingleton(() => GetAllNotesUseCase(getIt()));
        getIt.registerLazySingleton(() => GetAllToDoListUseCase(getIt()));

        getIt.registerLazySingleton(() => AddNoteUseCase(getIt()));

    }
}