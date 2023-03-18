import 'package:advisor/features/dach_board/controller/slider_controller.dart';
import 'package:advisor/features/dach_board/model/slider_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget({
    Key? key,
  }) : super(key: key);
  final sliderController = SliderController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: 400,
        child: CarouselSlider(
          items: sliderController.images,
          carouselController: sliderController.controller,
          options: CarouselOptions(
            height: 655,
            aspectRatio: 16 / 5,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInToLinear,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ));
  }
}

class ExploreWorldWidget extends StatelessWidget {
  const ExploreWorldWidget({
    super.key,
    required this.model,
  });
  final SliderModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 50, top: 50),
        child: Container(
            width: double.infinity,
            height: 700,
            decoration: const BoxDecoration(
              color: Color(0xFFffffff),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                SizedBox(
                    width: 400,
                    height: 700,
                    child: Image.asset(
                      model.image,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: 150,
                    left: 10,
                    child: Text(
                      "${model.title}",
                      style: Theme.of(context).textTheme.displayLarge,
                    ))
              ],
            )));
  }
}
