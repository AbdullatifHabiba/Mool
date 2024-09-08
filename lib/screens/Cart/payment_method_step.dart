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

    return Stack(
      children: [
        Padding(
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
              if (selectedMethod == 'credit') ...[
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Name on card',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Expiration date',
                          hintText: 'MM/YY',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Security code',
                          hintText: 'CVV',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
              RadioListTile<String>(
                title: const Text('Paymob'),
                value: 'paymob',
                groupValue: selectedMethod,
                onChanged: (value) => ref.read(paymentMethodProvider.notifier).state = value!,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Gift Cards and Promotional Codes',
                  suffixIcon: TextButton(
                    onPressed: null,
                    child: Text('Apply'),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton(
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
        ),
      ],
    );
  }
}
