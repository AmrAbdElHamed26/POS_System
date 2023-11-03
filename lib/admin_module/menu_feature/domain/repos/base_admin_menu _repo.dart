abstract class BaseAdminMenuRepo {
  void addItem({
    required String categoryName,
    required String categoryItem,
    required String categoryPrice,
  });

  void addNewCategory();

  void deleteItem();

  void deleteCategory();

  void editItem();

  void editCategory();
}
