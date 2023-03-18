import 'package:advisor/core/constants/app_image.dart';
import 'package:advisor/features/chat/logic/controller/chat_controller.dart';
import 'package:advisor/features/chat/view/widget/flat_action_btn.dart';
import 'package:advisor/features/chat/view/widget/flat_chat_message.dart';
import 'package:advisor/features/chat/view/widget/flat_message_input_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('MMMM d, y - hh:mm aa');
    var now = format.format(DateTime.now());
    final chatController = Get.put(ChatController());
    return GetBuilder<ChatController>(
      builder: (chatController) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: ListView.separated(
              itemCount: chatController.userMessage.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatChatMessage(
                              message: chatController.userMessage[index],
                              messageType: MessageType.sent,
                              showTime: true,
                              time: now.toString(),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                AppImages.personV,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            AppImages.girlV,
                          ),
                        ),
                        FlatChatMessage(
                          message: chatController.token[index],
                          showTime: true,
                          time: now.toString(),
                        ),
                      ],
                    ),
                  ],
                );
              }),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
          ),
          Column(
            children: [
              FlatMessageInputBox(
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
              const SizedBox(height: 10,)
            ],
          ),
        ]),
      ),
    );
  }
}
