import 'package:mydevteam/features/chat/data/models/message_model.dart';

import '../../../../core/source/remote/pocket_base_source.dart';
import 'chat_data_source.dart';

class ChatDataSourceImpl extends ChatDataSource {
  final PocketBaseSource pbSource;

  ChatDataSourceImpl(this.pbSource);

  @override
  Future<List<MessageModel>> getAllMessages() async {
    final result = await pbSource.getAll(
      collectionName: 'message',
    );

    List<MessageModel> data = result.data
        .map<MessageModel>((record) => MessageModel.fromJson(record.toJson()))
        .toList();
    print(data);
    return data;
  }

  @override
  Future<MessageModel> sendMessage(MessageModel message) async {
    final result = await pbSource.create(
      collectionName: 'message',
      body: message.toJson(),
    );
    return MessageModel.fromJson(result.data.toJson());
  }
}
