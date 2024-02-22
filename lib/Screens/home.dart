
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/Screens/product_tile.dart';

import '../Controller/productcontroller.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

   HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Shopping Demo',
          style: TextStyle(
              fontFamily: 'avenir',
              fontSize: 32,
              fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            
            onPressed: () {


            },
          )
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child:TextField(
                    decoration: InputDecoration(
                      hintText: "Search item",
                      prefixIcon: Icon(Icons.search,size: 25,)
                    ),
                  )
                ),
                IconButton(
                    icon: const Icon(Icons.view_list_rounded), onPressed: () {}),
                IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Obx(() {
            if (productController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 8/9,

                      mainAxisSpacing: 1,
                    ),
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                  ),
                );
            }


          })
        ],
      ),
    );
  }
}
