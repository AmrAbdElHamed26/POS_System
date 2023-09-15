import 'package:side_proj/admin_module/home_feature/domain_layer/entites/all_to_do_list_data.dart';


class AllToDoListModel extends AllToDoListData {
  const AllToDoListModel(
      {required super.messageState,
        required super.message,
        required super.messageID,
        required super.messageTime});

  factory AllToDoListModel.fromJson(json) => AllToDoListModel(
      message: json['message'],
      messageID: json['messageID'],
      messageState: json['messageState'],
      messageTime: json['messageTime'].toDate().toString());
}
