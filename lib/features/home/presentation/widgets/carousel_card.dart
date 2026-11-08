import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final int index;
  const CarouselCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Card"),
            Text("$index"),
          ],
        ),
      ),
    );
  }
}
