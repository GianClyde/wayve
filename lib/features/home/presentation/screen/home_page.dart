import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wayve/features/home/presentation/widgets/carousel_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              itemCount: 15,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
                int pageViewIndex,
              ) => CarouselCard(index: itemIndex),
            ),
          ),
        ],
      ),
    );
  }
}
