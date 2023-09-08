import '../../domain_layer/entites/all_notes_data.dart';

class AllNotesModel extends AllNotesData{

  const AllNotesModel({required super.message, required super.messageID});

  factory AllNotesModel.fromJson(json)=>AllNotesModel(message: json['message'] , messageID: json['messageID']);

}