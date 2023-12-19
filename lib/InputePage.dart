// ignore_for_file: library_private_types_in_public_api, use_super_parameters, sized_box_for_whitespace, avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoeproject_hive/DBHelper.dart';
import 'DB/Database.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  File? _image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _finalPriceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: _discountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Discount'),
            ),
            TextField(
              controller: _finalPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Final Price'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _pickImage();
              },
              child: const Text('Select Image'),
            ),
            if (_image != null)
              Image.file(
                _image!,
                height: 50,
              )
            else if (_imageUrlController.text.isNotEmpty)
              Image.network(
                _imageUrlController.text,
                height: 50,
              )
            else
              Container(),
            ElevatedButton(
              onPressed: () async {
                // await _pickImage();
                await onAddCardButtonClicked();
              },
              child: const Text('Add Card'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> onAddCardButtonClicked() async {
    final _shoeName = _nameController.text.trim();
    final _description = _descriptionController.text.trim();
    final _price = _priceController.text.trim();
    final _discount = _discountController.text.trim();
    final _finalPrice = _finalPriceController.text.trim();
    final _imageUrl = _imageUrlController.text.trim();

    if (_shoeName.isEmpty ||
        _description.isEmpty ||
        _price.isEmpty ||
        _discount.isEmpty ||
        _finalPrice.isEmpty ||
        _imageUrl.isEmpty) {
      return;
    }

    print(
        "$_shoeName $_description $_price $_discount $_finalPrice $_imageUrl");

    final _shoeCard = ShoeCard(
      shoe_name: _shoeName,
      description: _description,
      Price: _price,
      discount: _discount,
      final_price: _finalPrice,
      image_url: _imageUrl,
    );
    await addCard(_shoeCard);
    await getAllShoeCard(); 
    Navigator.pop(context, _shoeCard);
  }
}
