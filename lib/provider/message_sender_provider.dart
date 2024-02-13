import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/data/message_sender_api.dart';
import 'package:personal_website/provider/providers.dart';

final messageSenderProvider =
    NotifierProvider<MessageSenderNotifier, SendMessageStatus>(MessageSenderNotifier.new);

class MessageSenderNotifier extends Notifier<SendMessageStatus> {
  @override
  build() {
    return SendMessageStatus.initial;
  }

  Future<void> send(SendMessageRequest request) async {
    state = SendMessageStatus.loading;

    final messageSenderApi = ref.read(messageSenderApiProvider);

    try {
      await messageSenderApi.send(request);
      state = SendMessageStatus.success;
    } catch (e) {
      debugPrint(e.toString());
      state = SendMessageStatus.failed;
    }
  }
}

enum SendMessageStatus {
  initial,
  loading,
  failed,
  success;
}
