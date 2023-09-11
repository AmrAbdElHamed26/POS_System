import 'package:equatable/equatable.dart';

class AllNotesData extends Equatable{
  final String message ;
  final String messageID;
  final String messageTitle;
  final String messageTime;

  const AllNotesData( {required this.messageTitle, required this.message , required this.messageID ,required this.messageTime});

  @override
  List<Object?> get props => [message , messageID,messageTitle , messageTime];


}