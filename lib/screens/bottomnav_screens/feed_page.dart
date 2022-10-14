import 'dart:developer';

import 'package:caw_studios_assessment/providers/post_provider.dart';
import 'package:caw_studios_assessment/utils/helper.dart';
import 'package:caw_studios_assessment/widgets/post_item_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final scrollController = ScrollController();
  void onListen() {
    log(scrollController.offset.toString());
    setState(() {
      
    });
  }
  final List<String> items = [
    'All Communities',
    'Item2',
    'Item3',
    'Item4',
    'Item5'
  ];
  String? selectedValue = "All Communities";

  final List<String> categories = [
    'All Posts',
    'News',
    'Diet',
    'Lifestyle',
    'Symptoms',
    'Treatments'
  ];
  String? selectedcategories = "All Communities";
  @override
  void initState() {
    Provider.of<PostProvider>(context, listen: false).loadPosts();
    scrollController.addListener(onListen);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
        backgroundColor: Colors.grey.shade300,
       
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: RefreshIndicator(
              onRefresh: (){
                return  Provider.of<PostProvider>(context, listen: false).refresh();
              },
              child: CustomScrollView(
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 210,
                    collapsedHeight: 210,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CawSAppBarWidget(),
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedcategories = categories[index];
                                        });
                                      },
                                      child: Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: selectedcategories ==
                                                      categories[index]
                                                  ? Helper.primary
                                                      .withOpacity(0.3)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              border: Border.all(
                                                  color: Helper.primary)),
                                          child: Text(
                                            categories[index],
                                            style: TextStyle(
                                                fontSize: 16,
                                                letterSpacing: 1.3,
                                                fontWeight: selectedcategories ==
                                                        categories[index]
                                                    ? FontWeight.w700
                                                    : FontWeight.normal,
                                                color: Helper.primary),
                                          )),
                                    );
                                  },
                                  itemCount: categories.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                    SliverToBoxAdapter(
                    child: Consumer<PostProvider>(
                      builder: (context, snapshot, child) {
                        if(snapshot.loading){
                          return SizedBox(
                            height: MediaQuery.of(context).size.height*0.3,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                            itemBuilder: 
                          (BuildContext context, int index) {
                            return PostItemWidget(posts: snapshot.postModel!.posts![index],);
                          },
                          itemCount: snapshot.postModel!.posts!.length,
                        );
                      }
                    ),
                  )
                  // Consumer<PostProvider>(
                  //   builder: (context, snapshot, child) {
                  //     if(snapshot.loading){
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //     return SliverList(
                  //         delegate: SliverChildBuilderDelegate(
                  //       (BuildContext context, int index) {
                  //         return PostItemWidget();
                  //       },
                  //       childCount: snapshot.postModel!.posts!.length,
                  //     ));
                  //   }
                  // )
                ],
              ),
            ),
          ),
        ));
  }

  Widget CawSAppBarWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Community",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade500),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isDense: true,
                      isExpanded: true,
                      iconEnabledColor: Helper.primary,
                      hint: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Helper.primary,
                        ),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Helper.primary,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonWidth: 160,
                    ),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: "Search posts and members",
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Helper.primary),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.9, color: Helper.primary),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_outlined,
                        size: 30, color: Colors.grey.shade800))
              ],
            ),
          )
        ],
      ),
    );
  }
}
