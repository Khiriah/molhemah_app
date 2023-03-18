import 'package:advisor/core/constants/app_image.dart';
import 'package:advisor/features/dach_board/model/slider_model.dart';
import 'package:advisor/features/dach_board/vew/widget/slider_widgets/slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  final controller = CarouselController();
  RxInt currentPage = 0.obs;

  final images = [
    ExploreWorldWidget(
        model: SliderModel(
            image: AppImages.skillSlide,
            title: 'Skills')),
    ExploreWorldWidget(
        model: SliderModel(
            image: AppImages.exerciseSlide,
            title: 'Exercise')),
    ExploreWorldWidget(
        model: SliderModel(
            image: AppImages.musicSlide,
            title: 'Music')),
    ExploreWorldWidget(
        model: SliderModel(
            image: AppImages.maicSlide,
            title: 'Podcast ')),
    ExploreWorldWidget(
        model: SliderModel(
            image: AppImages.gameSlide,
            title: ' Games' )),
  ];

  onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
    update();
    return activePageIndex;
  }

  nextPage(int key) {
    int nextPage = currentPage.value;
    controller.animateToPage(nextPage);
  }
}
