import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/Cart/order_confirmation_screen.dart';
import 'package:mool/screens/Cart/shipping_address_step.dart';
import 'package:mool/widgets/custom_back_arrow.dart';
import 'payment_method_step.dart';
import 'order_review_step.dart';

// Providers
final checkoutStepProvider = StateProvider<int>((ref) => 0);

// Main Checkout Screen
class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(checkoutStepProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        automaticallyImplyLeading: false,
        leading: CustomBackArrow(
          onPressed: () {
            if (currentStep > 0) {
              ref.read(checkoutStepProvider.notifier).state--;
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Progress Indicator
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StepIndicator(step: 1, currentStep: currentStep, label: 'Shipping'),
                StepIndicator(step: 2, currentStep: currentStep, label: 'Payment'),
                StepIndicator(step: 3, currentStep: currentStep, label: 'Review'),
              ],
            ),
          ),
          // Current Step Content
          Expanded(
            child: _buildStepContent(currentStep, ref),
          ),
        ],
      ),
      
    );
  }

  Widget _buildStepContent(int step, WidgetRef ref) {
    switch (step) {
      case 0:
        return  ShippingAddressStep();
      case 1:
        return const PaymentMethodStep();
      case 2:
        return const OrderReviewStep();
      case 3:
        return const OrderConfirmationScreen();

      default:
        return const SizedBox.shrink();
    }
  }
}

// Step Indicator Widget
class StepIndicator extends StatelessWidget {
  final int step;
  final int currentStep;
  final String label;

  const StepIndicator({
    super.key,
    required this.step,
    required this.currentStep,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = currentStep > step - 1;
    final isCurrent = currentStep == step - 1;

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            color: isCurrent ? Colors.black : isCompleted ? Colors.green : Colors.grey,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(
              child: Text(
                step.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: isCurrent ? Colors.black : isCompleted ? Colors.green : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

