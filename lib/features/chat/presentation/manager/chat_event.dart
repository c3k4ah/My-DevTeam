part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatLoadMessages extends ChatEvent {
  const ChatLoadMessages();

  @override
  List<Object> get props => [];
}

class ChatSendMessage extends ChatEvent {
  final MessageEntity message;

  const ChatSendMessage(this.message);

  @override
  List<Object> get props => [message];
}
