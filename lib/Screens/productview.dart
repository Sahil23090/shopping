

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../Model/product.dart';
import 'login.dart';

class Game extends StatelessWidget {

  final Product product;
   const Game({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'ShopX',
          style: TextStyle(
              fontFamily: 'avenir', fontSize: 32, fontWeight: FontWeight.w900),
        ),
        actions: [
          const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text('Login')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 200,
              child: Card(
                elevation: 0.2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                        child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    )),
                    const Positioned(
                        top: 20,
                        left: 360,
                        child: Icon(
                          CupertinoIcons.heart,
                          color: Colors.black,
                        )),
                    const Positioned(
                        top: 50,
                        left: 360,
                        child: Icon(
                          Icons.share_rounded,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.title,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.only(left: 7),
                  child: Row(
                    children: [
                      Text(
                        product.rating.rate.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  product.rating.count.toString(),
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  "ratings.",
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text('\$${product.price}',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'avenir')),
            const SizedBox(
              height: 4,
            ),
            const Row(
              children: [
                Text(
                  "Free delivery by ",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
                Text(
                  "Monday.",
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Find a seller that delivers to you",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                TextButton(
                    style: const ButtonStyle(
                        side: MaterialStatePropertyAll(BorderSide(width: 2))),
                    onPressed: () {},
                    child: const Text('Enter pincode'))
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.fire_truck),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FREE Delivery',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  VerticalDivider(
                    thickness: 5,
                    color: Colors.black,
                  ),
                  Text(
                    'Delivery by Monday',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              trailing: GestureDetector(
                  onTap: () {}, child: const Icon(Icons.arrow_right)),
              subtitle: const Row(
                children: [
                  Text('If ordered with in'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '2 hours',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 4,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Center(
                      child: Icon(
                        Icons.change_circle_sharp,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("7 Days replacement"),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: Icon(Icons.attach_money),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Cash on delivery'),
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const Text(
              "Highlights....",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                          Colors.white,
                        )),
                        onPressed: () {




                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 20),
                        ))),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                          Colors.orange,
                        )),
                        onPressed: () {},
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )))
              ],
            ),
            const Center(
                child: Text(
              'Thankyou for checking Out',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            )),
            Text(product.id.toString())
          ],
        ),
      ),
    );
  }
}
