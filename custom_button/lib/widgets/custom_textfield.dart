import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool textEditHasFocus = false;

   @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        textEditHasFocus = _focusNode.hasFocus;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      // decoration: const BoxDecoration(color: Color.fromARGB(255, 10, 7, 7)),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            child: TextField(
              focusNode: _focusNode,
              decoration: const InputDecoration(
                // hintText: textEditHasFocus ? '' : 'Label',
                // hintStyle: TextStyle(
                //   color: Colors.grey,
                // ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(left: 40),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: textEditHasFocus ? 10 : 40,
            top: textEditHasFocus ? -10 : 13,
            child: InkWell(
              onTap: () {
                _focusNode.requestFocus();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 3),
                color: Colors.white,
                child: const Text('hello'),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                color: Colors.transparent,
                child: Image.asset('assets/lock_icon.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}