import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  var sameAdd = true.obs;
  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fill Details')),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,

                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withAlpha(50),
                      offset: Offset.zero,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Saved Address', style: TextStyle(fontSize: 20)),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Shubham Mishra"),
                            subtitle: Text(
                              'Bhidiura, Gyanpur, Bhadohi, 221304',
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Iconsax.more),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              AddressForm(addType: 'Delivery Address'),
              SizedBox(height: 10),
              Obx(
                () => Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .05,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray.withAlpha(50),
                        offset: Offset.zero,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        fillColor: WidgetStateProperty.all(
                          // box background color
                          AppColors.white,
                        ),
                        checkColor: AppColors.primaryColor,
                        value: sameAdd.value,
                        onChanged: (val) {
                          sameAdd.value = val ?? false;
                        },
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Same As Delivery Address',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => sameAdd.value
                    ? const SizedBox.shrink() // ✅ hide
                    : AddressForm(addType: 'Billing Address'),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Proceed To Payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressForm extends StatelessWidget {
  final String addType;
  const AddressForm({super.key, required this.addType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .4,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withAlpha(50),
            offset: Offset.zero,
            blurRadius: 2,
          ),
        ],
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(addType, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(hintText: "Name")),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(hintText: "Mobile Number"),
            ),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(hintText: "Email")),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Address Line 1"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Address Line 2"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "City"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Pincode"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
