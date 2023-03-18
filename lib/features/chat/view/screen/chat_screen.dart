import 'package:advisor/features/chat/logic/controller/chat_controller.dart';
import 'package:advisor/features/chat/view/widget/flat_action_btn.dart';
import 'package:advisor/features/chat/view/widget/flat_chat_message.dart';
import 'package:advisor/features/chat/view/widget/flat_message_input_box.dart';
import 'package:advisor/features/chat/view/widget/flat_page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);
  final chatController = Get.put(ChatController());
   var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return FlatPageWrapper(
      scrollType: ScrollType.floatingHeader,
      reverseBodyList: true,
      footer: FlatMessageInputBox(
        prefix: FlatActionButton(
          iconData: Icons.add,
          onPressed: () {},
        ),
        roundedCorners: true,
        suffix: FlatActionButton(
          iconData: Icons.image,
          onPressed: () {},
        ),
      ),
      children: [
        FlatChatMessage(
          message:
              "Yes, I'm here with you. I will be your friend, and get a fun time playing together. You are not alone. And I'll help you .   ",
          showTime: true,
          time: "2 mins ago",
        ),
        FlatChatMessage(
          message: "Can You help me?",
          messageType: MessageType.sent,
          showTime: true,
          time: "2 mins ago",
        ),
        FlatChatMessage(
          message: "I am tired !!",
          messageType: MessageType.sent,
          showTime: true,
          time: "2 mins ago",
        ),
        FlatChatMessage(
          message: "How Are You?",
          showTime: true,
          time: "2 mins ago",
        ),
        FlatChatMessage(
          message: "Hi Khairiah",
          showTime: true,
          time: "2 mins ago",
        ),
      ],
    );
  }
}
