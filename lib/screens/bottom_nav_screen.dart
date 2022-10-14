import 'dart:developer';

import 'package:caw_studios_assessment/screens/bottomnav_screens/feed_page.dart';
import 'package:caw_studios_assessment/screens/bottomnav_screens/library_page.dart';
import 'package:caw_studios_assessment/screens/bottomnav_screens/messages_page.dart';
import 'package:caw_studios_assessment/screens/bottomnav_screens/services_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../utils/helper.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  final List<Widget> _buildScreens = [
    const FeedPage(),
    const LibraryPage(),
    const FeedPage(),
    const MessagesPage(),
    const ServicesPage(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.feed_outlined),
        title: ("Feed"),
        textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        activeColorPrimary: Helper.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.library_books_outlined),
        title: ("Library"),
        textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        activeColorPrimary: Helper.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 36,
        ),
        activeColorPrimary: Helper.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat_bubble_outline),
        title: ("Message"),
        activeColorPrimary: Helper.primary,
        inactiveColorPrimary: Colors.grey,
        textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.design_services_outlined),
        title: ("Services"),
        activeColorPrimary: Helper.primary,
        inactiveColorPrimary: Colors.grey,
        textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens,
      items: _navBarsItems(),
      controller: controller,
      onItemSelected: (index) {
        if (index == 2) {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                       borderRadius: BorderRadius.circular(18)
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 80),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.edit,
                                color: Helper.primary,
                              ),
                              backgroundColor: Helper.primary.withOpacity(0.2),
                            ),
                            title: Text('Create a post'),
                            subtitle:
                                Text("Share your thoughts with the community"),
                            onTap: () {},
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          Divider(
                            indent: 16,
                            endIndent: 16,
                            thickness: 1,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.question_mark_outlined,
                                color: Helper.primary,
                              ),
                              backgroundColor: Helper.primary.withOpacity(0.2),
                            ),
                            title: Text('Ask a Question'),
                            subtitle: Text("Any doubts? Ask the community"),
                            onTap: () {},
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          Divider(
                            indent: 16,
                            endIndent: 16,
                            thickness: 1,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.poll_outlined,
                                color: Helper.primary,
                              ),
                              backgroundColor: Helper.primary.withOpacity(0.2),
                            ),
                            title: Text('Start a Poll'),
                            subtitle: Text("Need the opinion of many?"),
                            onTap: () {},
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          Divider(
                            indent: 16,
                            endIndent: 16,
                            thickness: 1,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.calendar_month,
                                color: Helper.primary,
                              ),
                              backgroundColor: Helper.primary.withOpacity(0.2),
                            ),
                            title: Text('Organise an Event'),
                            subtitle:
                                Text("Start a meet with people to share your joys"),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade800,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
      },
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      padding: NavBarPadding.all(5),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        children: <Widget>[
          const ListTile(title: Text('Bottom sheet')),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.attach_money),
              labelText: 'Enter an integer',
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save and close'),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
