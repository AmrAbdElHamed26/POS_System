import 'package:equatable/equatable.dart';

class AllToDoListData extends Equatable{
  final String message ;
  final String messageID;
  final String messageState;
  final String messageTime;

  const AllToDoListData( {required this.messageState, required this.message , required this.messageID ,required this.messageTime});

  @override
  List<Object?> get props => [message , messageID,messageState , messageTime];


}