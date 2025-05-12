class PaymentService {
  Future<bool> processPayment(double amount) async {
    // Simulate payment process (mock)
    await Future.delayed(Duration(seconds: 2)); // simulate network delay

    // In real code, integrate with Stripe, Razorpay, or Paystack
    // Return true if payment successful, false otherwise
    return true;
  }
}
