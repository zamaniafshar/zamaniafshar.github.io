import 'package:flutter/material.dart';
import 'package:personal_website/data/message_sender_api.dart';

class MessageSenderNotifier extends ValueNotifier<SendMessageStatus> {
  MessageSenderNotifier(this._messageSenderApi) : super(SendMessageStatus.initial);

  final MessageSenderApi _messageSenderApi;

  Future<void> send(SendMessageRequest request) async {
    value = SendMessageStatus.loading;

    try {
      await _messageSenderApi.send(request);
      value = SendMessageStatus.success;
    } catch (e) {
      debugPrint(e.toString());
      value = SendMessageStatus.failed;
    }
  }
}

enum SendMessageStatus {
  initial,
  loading,
  failed,
  success;
}
