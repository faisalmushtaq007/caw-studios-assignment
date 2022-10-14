import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

import '../models/post.dart';

class ImageWidget extends StatefulWidget {
    final Posts posts;
  const ImageWidget({ Key? key, required this.posts }) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  late Map<String, HighlightedWord> words = {};
  @override
  void initState() {
    super.initState();
    for(var str in widget.posts.description!.split(" ")){
      if(str.startsWith("#")){
        words.addAll({
          str: HighlightedWord(
        onTap: () {
            print("Flutter");
        },
        textStyle: TextStyle(color: Colors.indigo),
    )
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextHighlight(
    text: widget.posts.description ?? "", // You need to pass the string you want the highlights
    words: words, // Your dictionary words
    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400), 
),
AspectRatio(aspectRatio: 16/9, child: Image.network(widget.posts.image ?? "", filterQuality: FilterQuality.high, fit: BoxFit.fill,),)
      ],
    );
  }
}