import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarBoddy extends StatelessWidget {
  CarBoddy({Key? key, required this.item}) : super(key: key);

  var item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF4B4B4B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.delete_forever, size: 20, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
