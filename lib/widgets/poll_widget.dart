import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

import '../models/post.dart';

class PollWidget extends StatefulWidget {
    final Posts posts;
  const PollWidget({ Key? key, required this.posts }) : super(key: key);

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {

  @override
  Widget build(BuildContext context) {

   final int days = DateTime.parse(widget.posts.endDate ?? DateTime.now().toIso8601String())
                .difference(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ))
                .inDays;

            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: FlutterPolls(
                pollId: widget.posts.authorUsername.toString(),
                // hasVoted: hasVoted.value,
                // userVotedOptionId: userVotedOptionId.value,
                onVoted: (PollOption pollOption, int newTotalVotes) async {
                  await Future.delayed(const Duration(seconds: 2));

                  /// If HTTP status is success, return true else false
                  return true;
                },
                pollOptionsFillColor: Colors.white,
                votedProgressColor: Colors.blueGrey.shade100,
                leadingVotedProgessColor: Colors.blueGrey.shade300,
                pollEnded: days < 0,
                pollTitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.posts.title ?? "Poll",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                pollOptions: List<PollOption>.from(
                  widget.posts.polls!.map(
                    (option) {
                      var a = PollOption(
                        id: option.id,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            option.title ?? "",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800
                            ),
                          ),
                        ),
                        votes: option.votes!,
                      );
                      return a;
                    },
                  ),
                ),
                votedPercentageTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                metaWidget: Row(
                  children: [
                    const SizedBox(width: 6),
                    const Text(
                      '•',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      days < 0 ? "ended" : "ends in $days days",
                    ),
                  ],
                ),
              ),
            );
         
  }
}