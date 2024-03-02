import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/features/chat/domain/usecases/get_all_message_usecase.dart';
import 'package:mydevteam/features/chat/domain/usecases/send_message_usecase.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entites/message_entity.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase sendMessageUseCase;
  final GetAllMessagesUseCase getAllMessagesUseCase;

  ChatBloc(
    this.getAllMessagesUseCase,
    this.sendMessageUseCase,
  ) : super(ChatInitial()) {
    on<ChatLoadMessages>(_onChatLoadMessages);
    on<ChatSendMessage>(_onChatSendMessage);
  }

  Future<void> _onChatLoadMessages(
      ChatLoadMessages event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: ChatStatus.loading));
    final result = await getAllMessagesUseCase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        status: ChatStatus.error,
        errorMessage: failure.message,
      )),
      (messages) =>
          emit(state.copyWith(status: ChatStatus.loaded, messages: messages)),
    );
  }

  Future<void> _onChatSendMessage(
      ChatSendMessage event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: ChatStatus.loading));
    final result = await sendMessageUseCase(event.message);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ChatStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: ChatStatus.loaded,
          messages: [...state.messages, message],
        ),
      ),
    );
  }
}
