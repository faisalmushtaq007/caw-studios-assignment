import 'package:caw_studios_assessment/models/post.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final Posts posts;
  const QuestionWidget({ Key? key, required this.posts }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        posts.title!.isEmpty ? SizedBox() : Text(posts.title!, style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: posts.title!.isEmpty ? 0 : 10,),
        Text(posts.description ?? "", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, color: Colors.grey.shade600),),
      ],
    );
  }
}