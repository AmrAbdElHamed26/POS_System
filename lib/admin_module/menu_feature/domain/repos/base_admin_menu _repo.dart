abstract class BaseAdminMenuRepo {
  void addItem({
    required String categoryName,
    required String categoryItem,
    required String categoryPrice,
  });

  void addNewCategory({
  required String categoryName,
    required String categoryItem,
    required int categoryPrice,
    required String restaurantId,
  });

  void deleteItem();

  void deleteCategory();

  void editItem();

  void editCategory();
}
