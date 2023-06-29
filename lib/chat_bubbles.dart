import 'package:chatgpt_chat/chat_model.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

Widget chatBubble({required chatText, required ChatMessageType? type}) {
  return Row(
    children: [
      CircleAvatar(
        backgroundColor: bgColor,
        child: type == ChatMessageType.bot
            ? Image.asset("assets/ChatGPT_logo.png")
            : const Icon(
                Icons.person,
                color: Colors.white,
              ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: type == ChatMessageType.bot ? bgColor : Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Text(
            chatText.toString().trim(),
            style: TextStyle(
              color: type == ChatMessageType.bot ? textColor : chatBgColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ],
  );
}
