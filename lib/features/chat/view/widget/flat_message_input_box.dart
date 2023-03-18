import 'package:advisor/core/constants/colors_app.dart';
import 'package:advisor/features/chat/logic/controller/chat_controller.dart';
import 'package:advisor/features/chat/view/widget/flat_action_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlatMessageInputBox extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final bool? roundedCorners;
  FlatMessageInputBox({super.key,
    this.prefix,
    this.suffix,
    this.roundedCorners,
  });
  final chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    double cornerRadius() {
      if (roundedCorners != null && roundedCorners == true) {
        return 60.0;
      } else {
        return 0.0;
      }
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius()),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            spreadRadius: 20,
            blurRadius: 20,
            offset: const Offset(0, -5), // changes position of shadow
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: mainColor.withOpacity(0.30),
          borderRadius: BorderRadius.circular(cornerRadius()),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            prefix ??
                const SizedBox(
                  width: 0,
                  height: 0,
                ),
            Expanded(
              child: TextFormField(
                controller: chatController.chatController,
                decoration: InputDecoration(
                  hintText: "Enter Message...",
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColorDark.withOpacity(0.6),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(
                    16.0,
                  ),
                ),
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            ),
            suffix ??
                const SizedBox(
                  width: 0,
                  height: 0,
                ),
            FlatActionButton(
              icon: const Icon(
                Icons.send,
                size: 24.0,
              ),
              onPressed: ()async {
                await chatController
        .makePostRequest(chatController.chatController.text);
    chatController.chatController.clear();
    },
            ),
          ],
        ),
      ),
    );
  }
}
