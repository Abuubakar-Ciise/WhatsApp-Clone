import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/CallWidget.dart';
import 'package:flutter_application_1/components/CustomAppBar.dart';
import 'package:flutter_application_1/components/chats.dart';
import 'package:flutter_application_1/components/communities.dart';
import 'package:flutter_application_1/components/peopleStatus.dart';
import 'package:flutter_application_1/components/statusWidget.dart';
import 'package:flutter_application_1/usersData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  static const List<String> _AppBarTitles = <String>[
    "WhatsApp",
    'Status',
    'Communities',
    'Calls',
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  late final List<Widget> _pages = <Widget>[
    SingleChildScrollView(
      child: Column(
        children: [
         
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
            
              children: [
                Text(
                  'All',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 15,),
                Text(
                  'Unread',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(width: 15,),
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(width: 20,),
                Text(
                  'Group',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Column(
            children: users.map((user) {
              return CustomChats(
                imageURL: user.imageURL,
                name: user.name,
                role: user.role,
                message: user.message,
                time: user.time,
              );
            }).toList(),
          ),
        ],
      ),
    ),
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatusWidget(
            imageUrl: 'images/1.jpg',
            name: 'My Status',
            subtitle: 'Tap to add status update',
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Viewed updates',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: users.map((userStatus) {
              return ViewedUpdatesWidget(
                imageURL: userStatus.imageURL,
                name: userStatus.name,
                timestamp: userStatus.time,
              );
            }).toList(),
          ),
        ],
      ),
    ),
    const SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 20,),
        CommunitiesWidget(imageUrl: 'images/2.png', name: "Community"),
      ]),
    ),
    SingleChildScrollView(
      child: Column(
        
        children: users.map((user) {
          const SizedBox(height: 20,);
          return CallWidget(
              imageUrl: user.imageURL,
              name: user.name,
              time: user.callTime,
              isOutgoing: user.isOutgoingCall);
        }).toList(),
      ),
    ),
  ];
  List<Widget>? _getAppBarActions() {
    switch (_selectedIndex) {
      case 0:
        return [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_enhance)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ];
      case 1:
        return [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_enhance)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ];
      case 2:
        return [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_enhance)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ];
      case 3:
        return [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_enhance)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ];
    }
    return null;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
      _pageController.jumpToPage(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: _AppBarTitles[_selectedIndex],
        titleColor: Colors.green,
        actions: _getAppBarActions(),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index; 
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_notifications), label: 'Status'),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: 'Communities'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
