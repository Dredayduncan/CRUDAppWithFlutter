import 'package:contact_management_system/commonWidgets/customTextField.dart';
import 'package:contact_management_system/views/AllContacts.dart';
import 'package:contact_management_system/views/screenManager.dart';
import 'package:contact_management_system/widgetGenerators/apiCalls.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  final String? pid;
  final String? name;
  final String? contact;

  const AddContact({Key? key, this.pid, this.name, this.contact}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  Widget loadScreen = Center(child: CircularProgressIndicator(),);

  @override
  void initState() {
    // TODO: implement initState
    if (widget.pid != null){
      _name.text = widget.name!;
      _number.text = widget.contact!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.pid != null ? AppBar(
          backgroundColor: Colors.pink,
          title: const Text("Edit Contact"),
          centerTitle: true,
        ) : null,
        body: _buildScreen()
      ),
    );
  }

  Widget _buildScreen(){

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
              controller: _number,
              isNumber: true,
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
            child: widget.pid == null ? const Text("Add Contact") : const Text("Edit Contact"),
            onPressed: () {
              // Check if the user hit the edit button
              if (widget.pid != null){
                APICalls().updateContact(
                  conID: widget.pid,
                  uname: _name.text,
                  unumber: _number.text
                ).then((value) {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ScreenManager())
                    );
                  });
                });
              }
              else {
                // Add a new user
                APICalls().addContact(
                    uname: _name.text,
                    unumber: _number.text
                ).then((value) {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ScreenManager())
                    );
                  });
                });
              }
            },
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
