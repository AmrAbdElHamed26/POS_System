
import '../repos/base_admin_menu _repo.dart';

class AddIMenuItemUseCase {
  final BaseAdminMenuRepo _baseAdminMenuRepo;

  AddIMenuItemUseCase(this._baseAdminMenuRepo);

  void call(Map<String, dynamic> query) =>
      _baseAdminMenuRepo.addItem(
          categoryName: 'categoryName',
          categoryItem: 'categoryItem',
          categoryPrice: 'categoryPrice');
}
