import 'package:flutter/material.dart';
import '../services/hugging_service.dart';

class HuggingApi extends StatefulWidget {
  const HuggingApi({super.key});

  @override
  HuggingFaceDemoState createState() => HuggingFaceDemoState();
}

class HuggingFaceDemoState extends State<HuggingApi> {
  final _controller = TextEditingController();
  String _result = '';
  bool _loading = false;

  void _callAI() async {
    setState(() => _loading = true);
    final service = HuggingService();
    try {
      final output = await service.generateText(_controller.text);
      setState(() => _result = output);
    } catch (e) {
      setState(() => _result = 'Error: ${e.toString()}');
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hugging Face AI Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller),
            ElevatedButton(onPressed: _callAI, child: Text("Generate")),
            if (_loading) CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
