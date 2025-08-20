import 'package:constructo_user/src/features/nearby/widgets/nearbycard.dart';
import 'package:flutter/material.dart';

class Nearbyshoplist extends StatelessWidget {
  const Nearbyshoplist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return NearbyShopCard();
        },
      ),
    );
  }
}
