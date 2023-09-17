import 'package:side_proj/admin_module/notes-feature/domain_layer/repository/base_admin_notes_repository.dart';

import '../../../home_feature/data_layer/models/all_notes_model.dart';

class AddNoteUseCase{
  final BaseAdminNotesRepository baseAdminNotesRepository;

  AddNoteUseCase(this.baseAdminNotesRepository);

  Future<void>execute(AllNotesModel note)async {

    await baseAdminNotesRepository.addNote(note);
  }

}