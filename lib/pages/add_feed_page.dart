import 'package:flutter/material.dart';

class AddFeedPage extends StatefulWidget {
  const AddFeedPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddFeedPageState createState() => _AddFeedPageState();
}

class _AddFeedPageState extends State<AddFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Feed'),
      ),
      body: const Center(
        child: Text(
          'Add Feed Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}