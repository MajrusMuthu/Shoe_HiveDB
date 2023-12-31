// ignore_for_file: sized_box_for_whitespace, avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoeproject_hive/DB/Database.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required ShoeCard shoeCard});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final myItems = [
    Image.asset('Images/nike4.png', fit: BoxFit.cover),
    Image.asset('Images/nike4.png', fit: BoxFit.cover),
    Image.asset('Images/nike5.png', fit: BoxFit.cover),
    Image.asset('Images/nike6.png', fit: BoxFit.cover),
  ];
  final _color = ['Yellow', 'Black', 'Green', 'Blue', 'Red', 'Gray'];
  final _size = ['38', '39', '40', '41', '42', '43'];
  int myCurrentIndex = 0;

  String _selectedColors = 'Yellow';
  String _selectedSize = '38';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text("COMMON PROJECTS",
              style: TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.center),
        ),
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.menu_rounded,
                    color: Colors.black, size: 25),
                onPressed: () {},
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.black, size: 25),
                onPressed: () {},
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.checkroom_outlined,
                color: Colors.black,
              ))
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      height: 200,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      },
                    ),
                    items: myItems,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'COMMON PROJECTS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  'Original Achilles Low Sneakers ',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  '\$410',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 20),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Align(
                            child: Text(
                              "COLOR:",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            height: 50,
                            width: 70,
                            child: DropdownButton<String>(
                                onChanged: (value) {
                                  setState(() {
                                    _selectedColors = value!;
                                  });
                                  print(value);
                                },
                                value: _selectedColors,
                                items:
                                    _color.map<DropdownMenuItem<String>>((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                underline: Container(
                                  height: 0,
                                ),
                                isExpanded: true,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                itemHeight: 50),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Align(
                            child: Text(
                              "SIZE:",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            height: 50,
                            width: 50,
                            child: DropdownButton<String>(
                                onChanged: (value) {
                                  setState(() {
                                    _selectedSize = value!;
                                  });
                                  print(value);
                                },
                                value: _selectedSize,
                                items: _size.map<DropdownMenuItem<String>>((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                underline: Container(
                                  height: 0,
                                ),
                                isExpanded: true,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                itemHeight: 50),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 50,
              width: 420,
              color: Colors.black,
              child: Center(
                child: Transform.translate(
                  offset: const Offset(0, 0),
                  child: const Text(
                    "ADD TO CART   \$410",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Column(
              children: [
                Text(
                  "DESCRIPTION",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "Common Projects leather sneakers have gained cult status thanks to their minimalist design and superior construction. This white version is perfect for creating crisp city-smart looks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13, height: 1.8, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(height: 5, thickness: 2),
            const SizedBox(height: 20),
            const Column(
              children: [
                Text("SIZE & FIT",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Divider(height: 5, thickness: 2),
                SizedBox(height: 20),
                Text("DETAILS & CARE",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
