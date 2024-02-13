import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:personal_website/config/constants/constants.dart';

const _chatIdKey = 'chat_id';
const _textKey = 'text';

final class MessageSenderApi {
  Future<void> send(SendMessageRequest sendMessageRequest) async {
    final url = Uri.parse(kTelegramSendMessageApiUrl);
    final body = {
      _chatIdKey: kMyTelegramChatId,
      _textKey: sendMessageRequest.formatToTelegramMessage,
    };

    final response = await http
        .post(
          url,
          body: body,
        )
        .timeout(const Duration(seconds: 40));

    if (response.statusCode != 200) {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      throw 'Failed to send message';
    }
  }
}

extension on SendMessageRequest {
  String get formatToTelegramMessage {
    return 'subject: $subject\nfull name:$fullName\nemail: $email\n\n$comment';
  }
}

class SendMessageRequest {
  const SendMessageRequest({
    required this.fullName,
    required this.subject,
    required this.email,
    required this.comment,
  });

  final String fullName;
  final String subject;
  final String email;
  final String comment;

  Map<String, String> toJson() => {
        'full_name': fullName,
        'subject': subject,
        'email': email,
        'comment': comment,
      };
}
