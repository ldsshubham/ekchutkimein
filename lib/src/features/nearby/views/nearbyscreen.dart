import 'package:constructo_user/src/features/nearby/widgets/nearbycard.dart';
import 'package:flutter/material.dart';

class Nearbyscreen extends StatelessWidget {
  const Nearbyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nearby Shops')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, // <-- size of each grid item
            childAspectRatio: 0.8, // <-- adjust height/width ratio
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return NearbyShopCard();
          },
        ),
      ),
    );
  }
}
