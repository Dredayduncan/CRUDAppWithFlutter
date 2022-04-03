import 'package:flutter/material.dart';
import 'AddContact.dart';
import 'AllContacts.dart';

class ScreenManager extends StatefulWidget {

  const ScreenManager({Key? key}) : super(key: key);

  @override
  State<ScreenManager> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  late int _selectedIndex = 0;
  String _title = "";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setTitleInfo(String title) {
    setState(() {
      _title = title;
    });
  }

  Widget _getPage(int index){
    switch (index) {
      case 0:
        _setTitleInfo("All Contacts");
        return AllContacts();
    // return the daily page as a widget
      case 1:
        _setTitleInfo("Add Contact");
        return const AddContact();// return the profile page as a widget
    }

    _setTitleInfo("Page Not Found");
    return const Center(child: Text("There is no page builder for this index."),);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: {
          '/addContact': (context) => const AddContact(),
          '/allContacts': (context) => AllContacts()
        },
        home:  Scaffold(
            body: _getPage(_selectedIndex),
            appBar: AppBar(
              backgroundColor: Colors.pink,
              elevation: 1,
              title: Text(_title,),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.purple,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.perm_contact_cal),
                    label: "Contacts",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline_sharp),
                    label: "Add Contact"
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color(0xFFFCF4E1),
              unselectedItemColor: const Color(0xFF2B2B2B),
              // showSelectedLabels: false,
              // showUnselectedLabels: false,
              onTap: _onItemTapped,
            )
        )
    );
  }
}
