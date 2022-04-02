import 'package:contact_management_system/commonWidgets/customTextField.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  final String? pid;

  const AddContact({Key? key, this.pid}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.pid!.isNotEmpty)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          CustomTextField(
            hintText: "Enter Your Name",
            controller: _name
          ),
          const SizedBox(height: 15,),
          CustomTextField(
            hintText: "Enter Your Phone Number",
            controller: _number
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          child: const Text("Add Contact"),
          onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(360, 10),
                primary: Colors.red,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )
                )
            )
        ),
      ),
    );
  }
}
