import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/states/checkout.dart';
import 'package:mool/widgets/checkout_widgets/checkout.dart';
import 'checkout_screen.dart';


class ShippingAddressStep extends ConsumerWidget {
  ShippingAddressStep({super.key});

  final AddressWidgets addressWidgets = AddressWidgets();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(addressListProvider);
    final selectedAddressIndex = ref.watch(selectedAddressProvider);
    final isAddingNewAddress = ref.watch(isAddingNewAddressProvider);
    final editingAddressIndex = ref.watch(editingAddressIndexProvider);

    return Stack(
      
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter your shipping address', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),

              // Display the list of addresses if there are any
              if (addresses.isNotEmpty && !isAddingNewAddress && editingAddressIndex == null)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...addresses.asMap().entries.map((entry) {
                          int index = entry.key;
                          Map<String, String> address = entry.value;
                          bool isSelected = index == selectedAddressIndex;
                          return addressWidgets.buildAddressCard(context, ref, address, isSelected, index);
                        }),
                        const SizedBox(height: 16),

                        // Show the Add New Address button directly after the list of addresses
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
                      ],
                    ),
                  ),
                )

              // Display the new address form
              else if (isAddingNewAddress)
                Expanded(
                  child: SingleChildScrollView(
                    child: addressWidgets.buildAddressForm(context, ref, editingAddressIndex),
                  ),
                ),

              // If there are no addresses, show the Add New Address button by itself
              if (addresses.isEmpty && !isAddingNewAddress && editingAddressIndex == null)
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
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton(
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
        ),
      ],
    );
  }
}