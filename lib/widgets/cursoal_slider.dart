import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mool/widgets/image_slider.dart';
import 'package:mool/widgets/video_slider.dart';
import 'package:video_player/video_player.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> mediaPaths;

  const CarouselSliderWidget({Key? key, required this.mediaPaths}) : super(key: key);

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  List<Widget> _buildSliderItems() {
    return widget.mediaPaths.map((mediaPath) {
      if (mediaPath.endsWith('.mp4')) {
        return VideoSliderItem(videoPath: mediaPath);
      } else {
        return ImageSliderItem(imagePath: mediaPath);
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
      items: _buildSliderItems(),
    );
  }
}