// ignore_for_file: library_private_types_in_public_api, use_super_parameters, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:shoeproject_hive/DBHelper.dart';
import 'package:shoeproject_hive/DetailsPage.dart';
import 'package:shoeproject_hive/DB/Database.dart';
import 'package:shoeproject_hive/InputePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _list = ['Newest', 'Relevance', 'Popularity', 'Low Price', 'High Price'];

  String _selectedValue = 'Newest';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "COMMON PROJECTS",
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.black, size: 25),
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
            onPressed: () async {
              final newCard = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InputPage()),
              );

              if (newCard != null && newCard is ShoeCard) {
                print("New Card Added: $newCard");
              }
            },
            icon: const Icon(
              Icons.add_card,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const Divider(height: 1, thickness: 1),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: size.width / 2,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Center(
                    child: Text(
                      "Refine products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: size.width / 2,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Align(
                        child: Text(
                          'Sorted by',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 60,
                        width: 98,
                        child: DropdownButton<String>(
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                            print(value);
                          },
                          value: _selectedValue,
                          items: _list.map<DropdownMenuItem<String>>((e) {
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
                          underline: Container(),
                          isExpanded: true,
                          style: const TextStyle(fontSize: 15),
                          itemHeight: 50,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 1, thickness: 1),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: shoeListNotifier.value.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.8,
              ),
              itemBuilder: (context, index) {
                final shoeCard = shoeListNotifier.value[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(shoeCard: shoeCard),
                      ),
                    );
                  },
                  child: buildShoeCardWidget(shoeCard),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShoeCardWidget(ShoeCard shoeCard) {
    return Column(
      children: [
        Card(
          elevation: 0,
          child: Container(
            height: 120,
            width: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 247, 245, 245),
            ),
            child: Image.network(
              shoeCard.image_url ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 9),
        Text(
          shoeCard.shoe_name ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          shoeCard.description ?? '',
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5),
        Text('Price : ${shoeCard.Price ?? ''}'),
        const SizedBox(height: 5),
        Text('Discount: ${shoeCard.discount ?? ''}'),
        const SizedBox(height: 5),
        Text('Final Price: ${shoeCard.final_price ?? ''}'),
      ],
    );
  }
}
