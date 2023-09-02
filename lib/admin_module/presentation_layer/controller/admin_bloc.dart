import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part  'admin_events.dart';
part  'admin_states.dart';

class AdminBloc extends Bloc<AdminEvents , AdminStates> {

  AdminBloc():super(const AdminStates()){
    on<ChangePageEvent>((event, emit) => emit(CurrentPageChangedState(event.pageNumber))
    );
  }


}