import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        child: TextField(
          onChanged: (value) {
            setState(() {});
          },
          controller: widget.controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              // filled: true,
              contentPadding: const EdgeInsets.all(8),
              hintStyle: const TextStyle(color: Color(0xFF808083)),
              hintText: widget.hintText,
              // fillColor: const Color(0xFFD397A3),
              suffixIcon: widget.controller.text.isEmpty ? null : IconButton(
                color: const Color(0xFF808083),
                onPressed: () {
                  widget.controller.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.clear),
                iconSize: 20,
                padding: EdgeInsets.only(bottom: 1.0),
              )
          ),
        ),
      ),
    );;
  }
}
