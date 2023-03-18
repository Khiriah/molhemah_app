import 'package:advisor/features/chat/view/screen/chat_screen.dart';
import 'package:advisor/features/dach_board/vew/screen/dach_board_screen.dart';
import 'package:advisor/features/profile/view/screen/profile_screen.dart';
import 'package:advisor/features/video/view/screen/video_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    DashBoardScreen(),
    const ChatScreen(),
    const VideoScreen(),
    ProfileScreen(),
  ].obs;

  var title = [
    "",
    'Molhema',
    'Molhema',
    "Profile",
  ].obs;
}
