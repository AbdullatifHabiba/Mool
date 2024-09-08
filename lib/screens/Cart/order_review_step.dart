import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/Cart/payment_method_step.dart';
import 'package:mool/screens/Cart/shipping_address_step.dart';
import 'order_confirmation_screen.dart';

// Order Review Step
class OrderReviewStep extends ConsumerWidget {
  const OrderReviewStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(addressListProvider);
    final selectedAddressIndex = ref.watch(selectedAddressProvider);
    final paymentMethod = ref.watch(paymentMethodProvider);

    final selectedAddress = selectedAddressIndex >= 0 ? addresses[selectedAddressIndex] : null;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Please confirm your order', style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 16),
          Text('Shipping Address:', style: Theme.of(context).textTheme.headlineMedium),
          if (selectedAddress != null)
            Text('${selectedAddress['name']}, ${selectedAddress['street']}, ${selectedAddress['city']}'),
          const SizedBox(height: 16),
          Text('Payment Method:', style: Theme.of(context).textTheme.headlineMedium),
          Text(paymentMethod),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              // Handle order submission
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const OrderConfirmationScreen()),
              );
            },
            child: const Text('Submit Order'),
          ),
        ],
      ),
    );
  }
}