import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/pages/search/widgets/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(controller: _searchController),
                  sizeVer(15),
                  GridView.builder(
                      itemCount: 32,
                      shrinkWrap: true,
                      physics:const ScrollPhysics(),
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 100,
                          color: secondaryColor,
                        );
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
