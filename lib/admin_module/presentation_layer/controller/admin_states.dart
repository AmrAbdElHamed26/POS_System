
part of 'admin_bloc.dart';
class AdminStates extends Equatable {
  const AdminStates();

  @override
  List<Object> get props =>[];
}

class CurrentPageChangedState extends AdminStates{
  final int pageNumber ;
  const CurrentPageChangedState(this.pageNumber);

  int getCurrentPage()=>pageNumber;
  @override
  List<Object> get props =>[pageNumber];

}