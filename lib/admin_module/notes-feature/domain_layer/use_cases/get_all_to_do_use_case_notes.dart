import 'package:side_proj/admin_module/home_feature/data_layer/models/all_notes_model.dart';
import 'package:side_proj/admin_module/notes-feature/domain_layer/repository/base_admin_notes_repository.dart';

import '../../../home_feature/data_layer/models/all_to_do_list_model.dart';

class GetAllNotesUseCaseNotes {

  BaseAdminNotesRepository baseAdminNotesRepository ;

  GetAllNotesUseCaseNotes(this.baseAdminNotesRepository);

  Future<List<AllToDoListModel>> execute () async {
    return await baseAdminNotesRepository.getAllToDoData();
  }
}