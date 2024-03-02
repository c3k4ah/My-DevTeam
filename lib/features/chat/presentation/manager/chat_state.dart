part of 'chat_bloc.dart';

enum ChatStatus {
  initial,
  loading,
  loaded,
  error,
}

class ChatState extends Equatable {
  final List<MessageEntity> messages;
  final ChatStatus status;
  final String errorMessage;

  const ChatState({
    required this.messages,
    required this.status,
    required this.errorMessage,
  });

  ChatState copyWith({
    List<MessageEntity>? messages,
    ChatStatus? status,
    String? errorMessage,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        messages,
        status,
        errorMessage,
      ];
}

class ChatInitial extends ChatState {
  ChatInitial()
      : super(
          messages: [],
          status: ChatStatus.initial,
          errorMessage: '',
        );
}
