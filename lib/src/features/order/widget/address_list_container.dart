import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddressListContainer extends StatelessWidget {
  const AddressListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Shubham Mishra"),
            subtitle: Text('Bhidiura, Gyanpur, Bhadohi, 221304'),
            trailing: IconButton(onPressed: () {}, icon: Icon(Iconsax.more)),
          );
        },
      ),
    );
  }
}
