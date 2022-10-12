// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, constant_identifier_names, unused_element, prefer_const_constructors

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:login/LoginLayout/Components.dart';

Widget defultbutton({
  double width = double.maxFinite,
  bool isUppercase = true,
  double radius = 100.0,
  required VoidCallback function,
  required String text,
  context,
  token,
}) =>
    Container(
      width: width,
      child: TextButton(
        onPressed: function,
        child: Text(
          isUppercase ? text : text,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      decoration: BoxDecoration(
        // ignore: prefer_const_literals_to_create_immutables
        gradient: const LinearGradient(colors: [
          Colors.blue,
          Color.fromARGB(255, 4, 255, 255),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(radius),
      ),
    );

Widget defultformfield(
        {required final FormFieldValidator<String> validator,
        required TextEditingController controller,
        Color background = Colors.transparent,
        required TextInputType type,
        void Function(String)? onsubmit,
        void Function(String)? changed,
        VoidCallback? suffixpressed,
        VoidCallback? onTap,
        required String label,
        BorderSide? bord,
        bool isPassword = false,
        IconData? prefix,
        String email = 'email',
        TextStyle? Texcolor,
        IconData? suffix,
        TextStyle? labelst}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      onChanged: changed,
      onTap: onTap,
      onFieldSubmitted: onsubmit,
      keyboardType: type,
      style: Texcolor,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.white)),
        fillColor: background,
        labelStyle: labelst,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(const Radius.circular(12))),
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: Colors.white,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixpressed,
                icon: Icon(
                  suffix,
                  color: Colors.white,
                ),
              )
            : null,
        border: const OutlineInputBorder(borderSide: BorderSide()),
      ),
    );
FocusNode myFocusNode = FocusNode();

List<String> AvailablePort = SerialPort.availablePorts;
String? Available;
Widget Selectedport({
  Color background = Colors.transparent,
  void Function(String)? onsubmit,
  void Function(dynamic)? changed,
  VoidCallback? suffixpressed,
  VoidCallback? onTap,
  BorderSide? bord,
  bool isPassword = false,
  IconData? prefix,
  String email = 'email',
  TextStyle? Texcolor,
  IconData? suffix,
  TextStyle? labelst,
}) =>
    DropdownButtonFormField<String>(
      validator: (value) => value == null ? 'Please Choose A port' : null,
      value: Available,
      onTap: onTap,
      onChanged: changed,
      style: TextStyle(
          color: myFocusNode.hasFocus
              ? const Color.fromARGB(255, 4, 169, 245)
              : Colors.blue),
      hint: const Text('Please choose a port'),
      items: AvailablePort.map((port) {
        return DropdownMenuItem<String>(
          child: Text(port.toString()),
          value: port,
        );
      }).toList(),
    );
void Navigateto(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
int currentindex = 0;

List<NavigationRailDestination> bottomitems = [
  NavigationRailDestination(
      icon: Icon(Icons.safety_check), label: Text('Safety')),
  NavigationRailDestination(icon: Icon(Icons.cabin), label: Text('Home')),
  NavigationRailDestination(
      icon: Icon(Icons.location_city), label: Text('City')),
  NavigationRailDestination(icon: Icon(Icons.room), label: Text('Location')),
];
void changebottomnavindex(int index) {
  currentindex = index;
}

Widget getItem({required Icon icon, required Text text}) {
  return RotatedBox(
    quarterTurns: -1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [icon, text],
    ),
  );
}
