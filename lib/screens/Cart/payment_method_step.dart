import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'checkout_screen.dart';

// Providers
final paymentMethodProvider = StateProvider<String>((ref) => '');

// Payment Method Step
class PaymentMethodStep extends ConsumerWidget {
  const PaymentMethodStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMethod = ref.watch(paymentMethodProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Choose Payment Method', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          RadioListTile<String>(
            title: const Text('Cash on Delivery'),
            value: 'cash',
            groupValue: selectedMethod,
            onChanged: (value) => ref.read(paymentMethodProvider.notifier).state = value!,
          ),
          RadioListTile<String>(
            title: const Text('Credit Card'),
            value: 'credit',
            groupValue: selectedMethod,
            onChanged: (value) => ref.read(paymentMethodProvider.notifier).state = value!,
          ),
          RadioListTile<String>(
            title: const Text('Paymob'),
            value: 'paymob',
            groupValue: selectedMethod,
            onChanged: (value) => ref.read(paymentMethodProvider.notifier).state = value!,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: selectedMethod.isNotEmpty
                ? () => ref.read(checkoutStepProvider.notifier).state++
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text('Confirm and continue'),
          ),
        ],
      ),
    );
  }
}