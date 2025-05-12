import 'package:flutter/material.dart';
import '../services/payment_service.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {

  final paymentService = PaymentService();

  Future<void> _startPayment() async {
    bool success = await paymentService.processPayment(9.99);
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(
        content: Text(success ? "Payment Successful" : "Payment Failed"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(title: Text("Upgrade")),
      body: Center(
        child: ElevatedButton(          
          onPressed: () => _startPayment(),
          child: Text("Pay \$9.99"),
        ),
      ),
    );
  }
}
