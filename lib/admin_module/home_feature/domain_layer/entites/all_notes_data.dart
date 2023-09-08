import 'package:equatable/equatable.dart';

class AllNotesData extends Equatable{
  final String message ;
  final String messageID;

  const AllNotesData({required this.message , required this.messageID});

  @override
  List<Object?> get props => [message , messageID];


}