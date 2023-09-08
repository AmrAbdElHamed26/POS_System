import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/use_cases/get_name_use_case.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_events.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_states.dart';

import '../../domain_layer/use_cases/get_time_and_date_use_case.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvents, AdminHomeStates> {
  final GetTimeAndDateUsingTimeStampUseCase getTimeAndDateUsingTimeStampUseCase;

  final GetUserNameUseCase getUserNameUseCase;

  AdminHomeBloc(
      this.getTimeAndDateUsingTimeStampUseCase, this.getUserNameUseCase)
      : super(const AdminHomeStates()) {
    on<GetTimeAndDateUsingTimeStampEvent>(getTimeAndDate);
    on<GetUserNameEvent>(getUserName);
  }

  FutureOr<void> getTimeAndDate(event, emit) async {
    final result = await getTimeAndDateUsingTimeStampUseCase.execute();
    emit(state.copyWith(
      timeAndDate: result,
      timeAndDateStates: RequestState.loaded,
    ));
  }


  FutureOr<void> getUserName(event, emit) async {
    //amr
    final result = await getUserNameUseCase.execute();

  FutureOr<void> getUserName(event, emit) async{
    //amr abd el hamed
    final result =  await getUserNameUseCase.execute();

    emit(state.copyWith(
      userName: result,
      userNameStates: RequestState.loaded,
    ));
  }
}
