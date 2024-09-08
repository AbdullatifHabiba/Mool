import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/widgets/checkout_widgets/checkout.dart';
import 'checkout_screen.dart';

// Providers
final addressListProvider = StateProvider<List<Map<String, String>>>((ref) => []);
final selectedAddressProvider = StateProvider<int>((ref) => -1);
final isAddingNewAddressProvider = StateProvider<bool>((ref) => false);
final editingAddressIndexProvider = StateProvider<int?>((ref) => null);

class ShippingAddressStep extends ConsumerWidget {
  ShippingAddressStep({super.key});

  final AddressWidgets addressWidgets = AddressWidgets();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(addressListProvider);
    final selectedAddressIndex = ref.watch(selectedAddressProvider);
    final isAddingNewAddress = ref.watch(isAddingNewAddressProvider);
    final editingAddressIndex = ref.watch(editingAddressIndexProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter your shipping address', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          if (addresses.isNotEmpty && !isAddingNewAddress && editingAddressIndex == null)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...addresses.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, String> address = entry.value;
                      bool isSelected = index == selectedAddressIndex;
                      return addressWidgets.buildAddressCard(context, ref, address, isSelected, index);
                    }),
                  ],
                ),
              ),
            )
          else
          Expanded(child:
          SingleChildScrollView( child: 
            addressWidgets.buildAddressForm(context, ref, editingAddressIndex),
          )
          ),
          if (!isAddingNewAddress && editingAddressIndex == null)
            OutlinedButton.icon(
              onPressed: () {
                ref.read(isAddingNewAddressProvider.notifier).state = true;
                ref.read(editingAddressIndexProvider.notifier).state = null;
              },
              icon: const Icon(Icons.add),
              label: const Text('Add new address'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          // const Spacer(),
          ElevatedButton(
            onPressed: () {
              if (isAddingNewAddress || editingAddressIndex != null) {
                if (addressWidgets.formKey.currentState?.validate() ?? false) {
                  addressWidgets.formKey.currentState?.save();
                  if (editingAddressIndex != null) {
                    final updatedAddresses = List<Map<String, String>>.from(addresses);
                    updatedAddresses[editingAddressIndex] = Map.from(addressWidgets.newAddress);
                    ref.read(addressListProvider.notifier).state = updatedAddresses;
                    ref.read(editingAddressIndexProvider.notifier).state = null;
                  } else {
                    ref.read(addressListProvider.notifier).state = [
                      ...addresses,
                      Map.from(addressWidgets.newAddress),
                    ];
                    ref.read(selectedAddressProvider.notifier).state = addresses.length;
                  }
                  ref.read(isAddingNewAddressProvider.notifier).state = false;
                }
              } else if (selectedAddressIndex >= 0) {
                ref.read(checkoutStepProvider.notifier).state++;
              }
            },
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