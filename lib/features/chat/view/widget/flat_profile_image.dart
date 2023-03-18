import 'package:advisor/core/constants/app_image.dart';
import 'package:flutter/material.dart';

class FlatProfileImage extends StatelessWidget {

  final bool outlineIndicator;
  final Color outlineColor;
  final bool onlineIndicator;
  final Color onlineColor;
  final String imageUrl;
  final double size;
  final Function() onPressed;
  final Color backgroundColor;

  FlatProfileImage(
      {
        required  this.outlineIndicator,
        required   this.onlineColor,
        required   this.outlineColor,
        required   this.imageUrl,
        required   this.size,
        required  this.onlineIndicator,
        required  this.onPressed,
        required  this.backgroundColor,
      }
      );

  Border? flatIndicatorBorder(Color color) {
    if (outlineIndicator == null) {
      return null;
    } else {
      return Border.all(
        color: color,
        width: 2.0,
      );
    }
  }

  double imageSize() {
    if(size != null) {
      return size - 4.0;
    } else {
      return 8.0;
    }
  }

  bool showOnlineIndicator() {
    if(onlineIndicator != null && onlineIndicator == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(outlineIndicator != null && outlineIndicator == true) {
      return InkResponse(
        onTap: onPressed,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              width: size,
              height: size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: flatIndicatorBorder(outlineColor)),
              child: FlatIndicatorImage(
                width: imageSize(),
                height: imageSize(),
                indicator: outlineIndicator,
                image: imageUrl,
              ),
            ),
            OnlineIndicator(
              isEnabled: showOnlineIndicator(),
              color: onlineColor,
              size: size,
              borderColor: backgroundColor,
            ),
          ],
        ),
      );
    } else {
      return InkResponse(
        onTap: onPressed,
        child: Stack(
          children: [
            FlatIndicatorImage(
              width: size,
              height: size,
              indicator: outlineIndicator,
              image: imageUrl,
            ),
            OnlineIndicator(
              isEnabled: showOnlineIndicator(),
              color: onlineColor,
              size: size,
              borderColor: backgroundColor,
            )
          ],
        ),
      );
    }
  }
}

class OnlineIndicator extends StatelessWidget {
  final bool isEnabled;
  final Color color;
  final double size;
  final Color borderColor;
  OnlineIndicator({required this.isEnabled,required this.color,required this.size, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    double position = (size/100) * 15.0;
    print("Size: $size, Position: $position");
    return Positioned(
      bottom: position,
      right: position,
      child: Container(
        width: isEnabled ? 15.0 : 0.0,
        height: isEnabled ? 15.0 : 0.0,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}

class FlatIndicatorImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final bool indicator;
  FlatIndicatorImage({required this.image,required this.width,required this.height,required this.indicator});

  double imageMargin() {
    return indicator ? 4.0 : 8.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle
      ),
      margin: EdgeInsets.all(imageMargin()),
      width: width,
      height: height,
      child: ClipOval(
        child: profileImage(),
      ),
    );
  }

  Widget profileImage() {
    if(image == null || image.isEmpty){
      return Image.asset(
        AppImages.personV,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        AppImages.girlV,
        fit: BoxFit.cover,
      );
    }
  }
}
