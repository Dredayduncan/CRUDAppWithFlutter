import 'package:contact_management_system/widgetGenerators/apiCalls.dart';
import 'package:flutter/material.dart';

class AllContacts extends StatefulWidget {

  AllContacts({Key? key}) : super(key: key);

  @override
  State<AllContacts> createState() => _AllContactsState();
}

class _AllContactsState extends State<AllContacts> {
  late List contactList;
  Widget loader = const Center(child:CircularProgressIndicator());

  @override
  void initState() {
    // TODO: implement initState
    APICalls().getAllContacts().then(
      (value) {
        contactList = value;
        setState(() {
          loader = listOfContacts();
        });

      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loader,
    );
  }

  Widget listOfContacts() {
    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return contactList[index];
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 0,
        ),
        itemCount: contactList.length,
      ),
    );
  }
}
