import 'package:caw_studios_assessment/utils/helper.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class EventWidget extends StatelessWidget {
  final Posts posts;
  const EventWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          posts.title!.toUpperCase(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.grey.shade800, fontWeight: FontWeight.bold),
        ),
        Text(
          posts.createdAt.toString(),
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
              color: Colors.grey.shade700),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 5),
          elevation: 0,
          color: Helper.primary.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Are you going?",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: Colors.grey.shade800,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "21 People Going",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color: Colors.grey.shade700),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                        onPressed: () {},
                        child: Text("Yes", style: TextStyle(color: Helper.primary),)),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                        onPressed: () {},
                        child: Text("No", style: TextStyle(color: Helper.primary),))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
