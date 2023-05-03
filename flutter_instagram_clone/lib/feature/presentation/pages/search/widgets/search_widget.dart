import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';
class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchWidget({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: secondaryColor.withOpacity(0.3),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: primaryColor),
        decoration:const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,color: primaryColor),
          hintText: 'Search',
          hintStyle: TextStyle(color: secondaryColor,fontSize: 15)
        ),
      ),
    );
  }
}
