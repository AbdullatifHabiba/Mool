import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/Cart/payment_method_step.dart';
import 'package:mool/states/checkout.dart';
import 'checkout_screen.dart';

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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '${selectedAddress['name']},\n${selectedAddress['street']},\n${selectedAddress['city']}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          const SizedBox(height: 16),
          Text('Payment Method:', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(paymentMethod, style: const TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 24),
          Text('Order Summary', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          const OrderSummary(),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              // Handle order submission
              ref.read(checkoutStepProvider.notifier).state++;
            },
            child: const Text('Submit Order'),
          ),
        ],
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: TextStyle(fontSize: 16)),
            Text('2500 AED', style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: TextStyle(fontSize: 16)),
            Text('50 AED', style: TextStyle(fontSize: 16)),
          ],
        ),
        Divider(height: 32, color: Colors.black),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('2550 AED', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
