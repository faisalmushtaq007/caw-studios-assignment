import 'package:caw_studios_assessment/models/post.dart';
import 'package:caw_studios_assessment/screens/details_page.dart';
import 'package:caw_studios_assessment/utils/helper.dart';
import 'package:caw_studios_assessment/widgets/event_widget.dart';
import 'package:caw_studios_assessment/widgets/image_widget.dart';
import 'package:caw_studios_assessment/widgets/poll_widget.dart';
import 'package:caw_studios_assessment/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:page_transition/page_transition.dart';

class PostItemWidget extends StatefulWidget {
  final Posts posts;
  const PostItemWidget({Key? key, required this.posts}) : super(key: key);

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  Container _buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding _buildReactionsPreviewIcon(String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
      child: Image.asset(path, height: 40),
    );
  }

  Image _buildIcon(String path) {
    return Image.asset(
      path,
      height: 30,
      width: 30,
    );
  }

  Container _buildReactionsIcon(String path, Text text) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          Image.asset(path, height: 20),
          const SizedBox(width: 5),
          text,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reactions = [
      Reaction<String>(
        value: 'Like',
        title: _buildTitle('Like'),
        previewIcon: _buildReactionsPreviewIcon('assets/like.png'),
        icon: _buildReactionsIcon(
          'assets/like.png',
          Text(
            'Like',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      Reaction<String>(
        value: 'Happy',
        title: _buildTitle('Happy'),
        previewIcon: _buildReactionsPreviewIcon('assets/happy.png'),
        icon: _buildReactionsIcon(
          'assets/happy.png',
          Text(
            'haha',
            style: TextStyle(
              color: Color(0XFF3b5998),
            ),
          ),
        ),
      ),
      Reaction<String>(
        value: 'Angry',
        title: _buildTitle('Angry'),
        previewIcon: _buildReactionsPreviewIcon('assets/angry.png'),
        icon: _buildReactionsIcon(
          'assets/angry.png',
          Text(
            'Angry',
            style: TextStyle(
              color: Color(0XFFed5168),
            ),
          ),
        ),
      ),
      Reaction<String>(
        value: 'In love',
        title: _buildTitle('In love'),
        previewIcon: _buildReactionsPreviewIcon('assets/love.png'),
        icon: _buildReactionsIcon(
          'assets/love.png',
          Text(
            'In love',
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
      Reaction<String>(
        value: 'Sad',
        title: _buildTitle('Sad'),
        previewIcon: _buildReactionsPreviewIcon('assets/sad.png'),
        icon: _buildReactionsIcon(
          'assets/sad.png',
          Text(
            'Sad',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ];

    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: DetailsPage(), type: PageTransitionType.rightToLeft));
        },
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.posts.category!.toUpperCase(),
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "1min",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.posts.authorImage!),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: widget.posts.authorUsername,
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: widget.posts.type == "question"
                                        ? ' asked a question'
                                        : widget.posts.type == "event"
                                            ? " created an event"
                                            : widget.posts.type == "poll"
                                                ? " created a poll"
                                                : "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        color: Colors.grey.shade400)),
                              ],
                            ),
                          ),
                          Container(
                            padding: widget.posts.position! == "Expert"
                                ? EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 2)
                                : EdgeInsets.zero,
                            decoration: BoxDecoration(
                                color: widget.posts.position! == "Expert"
                                    ? Helper.primary.withOpacity(0.15)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                widget.posts.position! == "Expert"
                                    ? Icon(
                                        Icons.offline_bolt,
                                        size: 14,
                                      )
                                    : SizedBox(),
                                Text(
                                  widget.posts.position!.toUpperCase(),
                                  style: TextStyle(
                                      color: Helper.primary,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                              ),
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          height: 4,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade400,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Helper.primary,
                                        ),
                                        title: Text('Hide <Post type>'),
                                        subtitle:
                                            Text("See fewer posts like this"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        indent: 16,
                                        endIndent: 16,
                                        thickness: 1,
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.person_remove,
                                          color: Helper.primary,
                                        ),
                                        title: Text('Unfollow <username>'),
                                        subtitle:
                                            Text("See fewer posts like this"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        indent: 16,
                                        endIndent: 16,
                                        thickness: 1,
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.info_outline,
                                          color: Helper.primary,
                                        ),
                                        title: Text('Report <Post type>'),
                                        subtitle:
                                            Text("See fewer posts like this"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        indent: 16,
                                        endIndent: 16,
                                        thickness: 1,
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.link,
                                          color: Helper.primary,
                                        ),
                                        title: Text('Copy <Post type> link'),
                                        subtitle:
                                            Text("See fewer posts like this"),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Icon(Icons.more_vert,
                            color: Colors.grey.shade700, size: 25))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: mainPostContent(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Helper.primary,
                    size: 18,
                  ),
                  SizedBox(width: 6),
                  Text(
                    widget.posts.location!,
                    style: TextStyle(color: Helper.primary, fontSize: 12),
                  ),
                ],
              ),
              Divider(
                indent: 5,
                endIndent: 5,
                thickness: 1.1,
              ),
              MembersReactWidget(),
              Divider(
                indent: 5,
                endIndent: 5,
                thickness: 1.1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Builder(
                        builder: (ctx) {
                          return ReactionButton<String>(
                            onReactionChanged: (String? value) {
                              ScaffoldMessenger.of(ctx).showSnackBar(
                                SnackBar(
                                  margin: EdgeInsets.only(
                                      bottom: 20, left: 5, right: 5),
                                  content: Text('Post $value'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            reactions: reactions,
                            boxPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 6),
                            initialReaction: Reaction<String>(
                              value: widget.posts.noOfLikes.toString(),
                              icon: Row(
                                textBaseline: TextBaseline.alphabetic,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.thumb_up_off_alt_outlined,
                                    color: Colors.grey.shade700,
                                    size: 19,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    widget.posts.noOfComments.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700),
                                  )
                                ],
                              ),
                            ),
                            boxColor: Colors.white,
                            boxElevation: 7,
                            boxOffset: Offset.fromDirection(180, 20),
                            boxDuration: Duration(milliseconds: 300),
                            itemScaleDuration:
                                const Duration(milliseconds: 200),
                          );
                        },
                      ),
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_rounded,
                          color: Colors.grey.shade700,
                          size: 19,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          widget.posts.noOfComments.toString(),
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        )
                      ],
                    ),
                    Icon(
                      Icons.bookmark_outline,
                      color: Colors.grey.shade700,
                      size: 20,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0)),
                            ),
                            builder: (context) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        height: 4,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(
                                          Icons.send_rounded,
                                          color: Helper.primary,
                                        ),
                                        backgroundColor:
                                            Helper.primary.withOpacity(0.2),
                                      ),
                                      title: Text('Send as a private message'),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(
                                          Icons.dashboard,
                                          color: Helper.primary,
                                        ),
                                        backgroundColor:
                                            Helper.primary.withOpacity(0.2),
                                      ),
                                      title: Text('Share as a post'),
                                      onTap: () {},
                                    ),
                                    Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      thickness: 1.2,
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.indigo,
                                        ),
                                        backgroundColor:
                                            Helper.primary.withOpacity(0.2),
                                      ),
                                      title: Text('Share on Facebook'),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(
                                          Icons.whatsapp,
                                          color: Colors.green[700],
                                        ),
                                        backgroundColor:
                                            Helper.primary.withOpacity(0.2),
                                      ),
                                      title: Text('Share via Whatsapp'),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        child: Icon(
                          Icons.share_outlined,
                          color: Colors.grey.shade700,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Row MembersReactWidget() {
    return Row(
      children: [
        Container(
          width: 50,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(widget.posts.authorImage!),
              ),
              Positioned(
                left: 9,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                ),
              ),
              Positioned(
                left: 20,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                ),
              )
            ],
          ),
        ),
        Text(
          widget.posts.noOfLikes.toString() + " memebers reacted to this post.",
          style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w100),
        )
      ],
    );
  }

  mainPostContent() {
    switch (widget.posts.type) {
      case "question":
        return QuestionWidget(posts: widget.posts);
      case "event":
        return EventWidget(posts: widget.posts);
      case "image":
        return ImageWidget(posts: widget.posts);
      case "poll":
        return PollWidget(posts: widget.posts);
      default:
        return Text(
          widget.posts.description ?? "",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
        );
    }
  }
}
