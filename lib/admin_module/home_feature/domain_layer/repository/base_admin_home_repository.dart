
import '../../data_layer/models/all_notes_model.dart';

abstract class BaseAdminHomeRepository{
    Future<String>getDateAndTimeUsingTimeStamp();
    Future<String>getUserName();
    Future<List<AllNotesModel>>getAllNotes();
}