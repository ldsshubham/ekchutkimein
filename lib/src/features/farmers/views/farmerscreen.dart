
// import 'package:constructo_user/src/features/farmers/views/servicepage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// import '../../home/widgets/appcategory.dart';
// import '../../product/views/productcard.dart';
// import '../controllers/filtercontroller.dart';

// class FarmerScreen extends StatelessWidget {
//   const FarmerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final filterController = Get.put(FilterController());

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Agricultural Services'),
//         automaticallyImplyLeading: false,
//       ),
//       drawer: Drawer(
//   child: ListView(
//     padding: EdgeInsets.all(16),
//     children: [
//       Text('Filter Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

//       Text('Availability:', style: TextStyle(fontWeight: FontWeight.bold)),
//       Obx(() => Column(
//         children: ['1hr', '2hr', '3hr'].map((option) {
//           return RadioListTile(
//             title: Text(option),
//             value: option,
//             groupValue: filterController.selectedAvailability.value,
//             onChanged: (value) => filterController.selectedAvailability.value = value!,
//           );
//         }).toList(),
//       )),

//       Divider(),

//       Text('Sort by Price:', style: TextStyle(fontWeight: FontWeight.bold)),
//       Obx(() => Column(
//         children: ['low', 'high'].map((option) {
//           return RadioListTile(
//             title: Text(option == 'low' ? 'Low to High' : 'High to Low'),
//             value: option,
//             groupValue: filterController.selectedPrice.value,
//             onChanged: (value) => filterController.selectedPrice.value = value!,
//           );
//         }).toList(),
//       )),

//       ListTile(
//         title: Text('Select Date'),
//         trailing: Icon(Icons.calendar_today),
//         subtitle: Obx(() => Text(
//           filterController.selectedDate.value != null
//               ? filterController.selectedDate.value!.toLocal().toString().split(' ')[0]
//               : 'No date selected',
//         )),
//         onTap: () async {
//           final pickedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime.now(),
//             lastDate: DateTime(2030),
//           );
//           if (pickedDate != null) {
//             filterController.selectedDate.value = pickedDate;
//           }
//         },
//       ),

//       ElevatedButton(
//         onPressed: () {
//           Navigator.pop(context); // close drawer
//           // You can apply filtering here or in GridView
//         },
//         child: Text('Apply Filters'),
//       ),
//     ],
//   ),
// ),

//       body: Padding(
//         padding: EdgeInsetsGeometry.all(8),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Iconsax.search_normal),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                   icon: Icon(Iconsax.filter_search),
//                 ),
//               ],
//             ),

//             SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 8,
//                     crossAxisSpacing: 8,
//                     childAspectRatio: .75,
//                   ),

//                   itemCount: appCategories.length,
//                   itemBuilder: (context, index) {
//                     final product = appCategories[index];
//                     // print('Product: ${product.name}, Desc: ${product.appDesc}, Img: ${product.imgPath}');
//                     return ProductCard(
//                       product: product,
//                       widget: Servicepage(service: product),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/features/farmers/views/servicepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../home/widgets/appcategory.dart';
import '../../product/views/productcard.dart';
import '../controllers/filtercontroller.dart';


class FarmerScreen extends StatelessWidget {
  FarmerScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            const Text('Filter Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            const Text('Availability:', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Column(
              children: ['1hr', '2hr', '3hr'].map((option) {
                return RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: filterController.selectedAvailability.value,
                  onChanged: null,
                  // onChanged: (value) => filterController.selectedAvailability.value = value!,
                );
              }).toList(),
            )),

            const Divider(),

            const Text('Sort by Price:', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Column(
              children: ['low', 'high'].map((option) {
                return RadioListTile(
                  title: Text(option == 'low' ? 'Low to High' : 'High to Low'),
                  value: option,
                  groupValue: filterController.selectedPrice.value,
                  onChanged:null,
                  // onChanged: (value) => filterController.selectedPrice.value = value!,
                );
              }).toList(),
            )),

            const Divider(),

            

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Close drawer
              },
              icon: const Icon(Iconsax.filter),
              label: const Text('Apply Filters'),
            )
          ],
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Agricultural Services'),
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.search_normal),
                      hintText: 'Search services...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  icon: const Icon(Iconsax.filter_search),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Obx(() {
                final filtered = _applyFilters();

                return GridView.builder(
                  itemCount: filtered.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final product = filtered[index];
                    return ProductCard(
                      product: product,
                      widget: Servicepage(service: product),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// Dummy filtering logic — adjust to your model
  List<dynamic> _applyFilters() {
    List filtered = [...appCategories];

    if (filterController.selectedAvailability.value.isNotEmpty) {
      filtered = filtered.where((item) =>
          item.availability == filterController.selectedAvailability.value).toList();
    }

    if (filterController.selectedPrice.value == 'low') {
      filtered.sort((a, b) => a.price.compareTo(b.price));
    } else if (filterController.selectedPrice.value == 'high') {
      filtered.sort((a, b) => b.price.compareTo(a.price));
    }

    // Optionally filter by date (if your item has a date field)
    if (filterController.selectedDate.value != null) {
      // Add your logic here if dates are relevant to items
    }

    return filtered;
  }
}
