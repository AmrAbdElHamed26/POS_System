part of 'admin_bloc.dart';

abstract class AdminEvents extends Equatable {
  const AdminEvents();

  @override
  List<Object?> get props => [];
}

class ChangePageEvent extends AdminEvents {
  final int pageNumber;

  const ChangePageEvent({required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}
