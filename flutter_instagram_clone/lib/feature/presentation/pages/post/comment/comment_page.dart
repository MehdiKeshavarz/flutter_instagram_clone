import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants.dart';
import 'package:flutter_instagram_clone/feature/presentation/widgets/form_container_widget.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool _isUserReplaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        title: const Text(
          'Comments',
          style: TextStyle(
              fontSize: 18, color: primaryColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    sizeHor(10),
                    const Text(
                      'UserName',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                sizeVer(12),
                const Text(
                  'This is very beautiful place',
                  style: TextStyle(color: primaryColor),
                ),
              ],
            ),
          ),
          sizeVer(10),
          const Divider(color: secondaryColor),
          sizeVer(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  sizeHor(10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      fontSize: 15)),
                              Icon(
                                Icons.favorite_outline,
                                size: 20.0,
                                color: darkGreyColor,
                              ),
                            ],
                          ),
                          sizeVer(4),
                          const Text('This is comment',
                              style: TextStyle(color: primaryColor)),
                          sizeVer(6),
                          Row(
                            children: [
                              const Text('09/05/2023',
                                  style: TextStyle(
                                      color: darkGreyColor, fontSize: 12)),
                              sizeHor(15),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isUserReplaying =! _isUserReplaying;
                                    });
                                  },
                                  child: const Text('Replay',
                                      style: TextStyle(
                                          color: darkGreyColor, fontSize: 12))),
                              sizeHor(15),
                              const Text('View Replays',
                                  style: TextStyle(
                                      color: darkGreyColor, fontSize: 12)),
                            ],
                          ),

                          _isUserReplaying == true ? sizeVer(10) : sizeVer(0),
                          _isUserReplaying == true ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const FormContainerWidget(hintText: 'post your Replay...'),
                              sizeVer(10),
                              const Text('Post',style: TextStyle(color: blueColor))
                            ],
                          ): Container(width: 0,height: 0)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          _commentSection(),
        ],
      ),
    );
  }

  _commentSection() {
    return Column(
      children: [
        const Divider(color: secondaryColor, thickness: 0.4),
        Container(
          width: double.infinity,
          height: 48,
          color: backGroundColor, //Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(100)),
                ),
                sizeHor(10),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: primaryColor),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add comment',
                        hintStyle: TextStyle(color: secondaryColor)),
                  ),
                ),
                const Icon(
                  Icons.send,
                  color: blueColor,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
