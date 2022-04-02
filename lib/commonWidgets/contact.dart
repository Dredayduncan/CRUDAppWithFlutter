import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Contact extends StatelessWidget {
  final String pid;
  final String pname;
  final String contact;

  const Contact({
    Key? key,
    required this.pid,
    required this.pname,
    required this.contact
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.amberAccent,
            label: "Edit",
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.red,
            label: "Delete",
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Name:",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue
                  ),
                ),
                const SizedBox(width: 5.0,),
                Text(
                  pname,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.redAccent
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  "Contact:",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigoAccent
                  ),
                ),
                const SizedBox(width: 5.0,),
                Text(
                  contact,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
