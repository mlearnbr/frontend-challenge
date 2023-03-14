import 'package:flutter/material.dart';

class PeopleDetailsPage extends StatefulWidget {
  const PeopleDetailsPage({super.key});

  @override
  State<PeopleDetailsPage> createState() => _PeopleDetailsPageState();
}

class _PeopleDetailsPageState extends State<PeopleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OutlinedButton(onPressed: () {}, child: const Text("aa")),
    );
  }
}
