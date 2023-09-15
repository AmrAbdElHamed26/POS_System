import 'package:equatable/equatable.dart';
import 'package:side_proj/admin_module/home_feature/data_layer/models/all_notes_model.dart';

class AdminNotesEvents extends Equatable{
  const AdminNotesEvents();

  @override
  List<Object?> get props => [];

}

class AddNoteEvent extends AdminNotesEvents{
  AllNotesModel note ;

  AddNoteEvent({required this.note});
}

class GetAllNotesEvent extends AdminNotesEvents{}