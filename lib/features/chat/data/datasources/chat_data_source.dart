import 'package:mydevteam/features/chat/data/models/message_model.dart';

abstract class ChatDataSource {
  Future<List<MessageModel>> getAllMessages();

  Future<MessageModel> sendMessage(MessageModel message);
}
