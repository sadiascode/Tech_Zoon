import 'package:flutter/material.dart';
import '../widget/custom_card.dart';
import '../widget/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.phone_android, "title": "Mobile"},
    {"icon": Icons.laptop_mac, "title": "Laptop"},
    {"icon": Icons.tablet_android, "title": "Tablet"},
    {"icon": Icons.headphones, "title": "Accessories"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121215),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121215),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: const Text(
            "Tech Zoon",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SearchField(onChanged: (String p1) {  }, hintText: 'Search Mobile, Laptop...',),

            const SizedBox(height: 20),

            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF205090),
                    Color(0xFF2D7DFF),
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summer Sale",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Up to 50% OFF on Mobiles & Laptops",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Categories",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1D22),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          categories[index]["icon"],
                          color: const Color(0xFF205090),
                          size: 30,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categories[index]["title"],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Featured Products",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Column(
              children: [
                CustomCard(
                  name: "iPhone 15 Pro",
                  price: "\$999",
                ),
              ],
            ),
            CustomCard(
              name: "Accessories",
              price: "\$999",
            ),
            CustomCard(
              name: "Laptop",
              price: "\$999",
            ),
            CustomCard(
              name: "Tablet",
              price: "\$999",
            ),CustomCard(
              name: "iPhone 15 Pro",
              price: "\$999",
            ),CustomCard(
              name: "Laptop",
              price: "\$999",
            ),CustomCard(
              name: "iPhone 15 Pro",
              price: "\$999",
            ),






            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}