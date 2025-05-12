import 'package:flutter/material.dart';
import 'package:test_app/screens/hugging_api.dart';
import 'ocr_screen.dart';
import 'payment_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan & Pay")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OCRScreen()),
                  ),
              child: Text("Scan Item"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentScreen()),
                  ),
              child: Text("Upgrade"),
            ),
             SizedBox(height: 20),
             ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HuggingApi()),
                  ),
              child: Text("Hugging Face AI"),
            ),
          ],
        ),
      ),
    );
  }
}
