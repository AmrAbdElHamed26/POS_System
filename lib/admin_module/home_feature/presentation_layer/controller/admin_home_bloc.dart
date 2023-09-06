
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_events.dart';
import 'package:side_proj/admin_module/home_feature/presentation_layer/controller/admin_home_states.dart';

import '../../domain_layer/use_cases/get_time_and_date_use_case.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvents , AdminHomeStates>{
  final GetTimeAndDateUsingTimeStampUseCase getTimeAndDateUsingTimeStampUseCase ;
  AdminHomeBloc(this.getTimeAndDateUsingTimeStampUseCase):super(const AdminHomeStates()){
    
    on<GetTimeAndDateUsingTimeStampEvent>((event, emit) async{
      final result =  await getTimeAndDateUsingTimeStampUseCase.execute();
      emit(AdminHomeStates(
        timeAndDate: result,
        timeAndDateStates: RequestState.loaded,
      ));
    });
  }
}