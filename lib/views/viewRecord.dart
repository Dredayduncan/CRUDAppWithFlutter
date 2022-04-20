import 'package:flutter/material.dart';

class ViewRecord extends StatelessWidget {
  final String contact;
  final String name;

  const ViewRecord({Key? key, required this.name, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Record"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Text("Name: "),
                Text(name)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                const Text("Contact: "),
                Text(contact)
              ],
            )

          ],
        ),
      ),
    );
  }
}
