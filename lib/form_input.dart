import 'package:flutter/material.dart';

class UserFormWidget extends StatefulWidget {
  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildName(),
      const SizedBox(height: 16,),
      buildEmail(),
      const SizedBox(height: 16,),
      buildSubmit(),
    ],
  );

  Widget buildName() => TextFormField(
    decoration: InputDecoration(
      labelText: 'Name',
      border: OutlineInputBorder(),
    ),
  );

  Widget buildEmail() => TextFormField(
    decoration: InputDecoration(
      labelText: 'Email',
      border: OutlineInputBorder(),
    ),
  );

  Widget buildSubmit() => ElevatedButton(
    child: Text("Save"),
    onPressed: (){},
  );
}
