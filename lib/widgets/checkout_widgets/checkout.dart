import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/Cart/shipping_address_step.dart';

class AddressWidgets {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, String> newAddress = {};

  Widget buildAddressForm(BuildContext context, WidgetRef ref, int? editingAddressIndex) {
    final addresses = ref.watch(addressListProvider);
    final address = editingAddressIndex != null ? addresses[editingAddressIndex] : {};

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButtonFormField<String>(
            value: address['country'],
            items: <String>['Country A', 'Country B', 'Country C'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(labelText: 'Country'),
            onChanged: (String? newValue) {
              newAddress['country'] = newValue ?? '';
            },
            validator: (value) => value == null ? 'Please select your country' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: address['name'],
            decoration: const InputDecoration(labelText: 'Full Name'),
            validator: (value) => value?.isEmpty ?? true ? 'Please enter your name' : null,
            onSaved: (value) => newAddress['name'] = value ?? '',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  initialValue: address['phoneCode'],
                  decoration: const InputDecoration(labelText: 'Code'),
                  validator: (value) => value?.isEmpty ?? true ? 'Code' : null,
                  onSaved: (value) => newAddress['phoneCode'] = value ?? '',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: TextFormField(
                  initialValue: address['phone'],
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter your phone number' : null,
                  onSaved: (value) => newAddress['phone'] = value ?? '',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: address['street'],
            decoration: const InputDecoration(labelText: 'Street name'),
            validator: (value) => value?.isEmpty ?? true ? 'Please enter your street' : null,
            onSaved: (value) => newAddress['street'] = value ?? '',
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: address['buildingNo'],
            decoration: const InputDecoration(labelText: 'Building name / no'),
            validator: (value) => value?.isEmpty ?? true ? 'Please enter your building number' : null,
            onSaved: (value) => newAddress['buildingNo'] = value ?? '',
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: address['city'],
            decoration: const InputDecoration(labelText: 'City / Area'),
            validator: (value) => value?.isEmpty ?? true ? 'Please enter your city' : null,
            onSaved: (value) => newAddress['city'] = value ?? '',
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: address['landmark'],
            decoration: const InputDecoration(labelText: 'Nearest landmark'),
            validator: (value) => value?.isEmpty ?? true ? 'Please enter your landmark' : null,
            onSaved: (value) => newAddress['landmark'] = value ?? '',
          ),
        ],
      ),
    );
  }

  Widget buildAddressCard(BuildContext context, WidgetRef ref, Map<String, String> address, bool isSelected, int index) {
    return GestureDetector(
      onTap: () => ref.read(selectedAddressProvider.notifier).state = index,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Shipping address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  TextButton(
                    onPressed: () {
                      ref.read(isAddingNewAddressProvider.notifier).state = true;
                      ref.read(editingAddressIndexProvider.notifier).state = index;
                    },
                    child: const Text('Edit', style: TextStyle(color: Colors.blue)),
                  ),
                  TextButton(
                    onPressed: () {
                      final updatedAddresses = List<Map<String, String>>.from(ref.read(addressListProvider));
                      if (index >= 0 && index < updatedAddresses.length) {
                        updatedAddresses.removeAt(index);
                        ref.read(addressListProvider.notifier).state = updatedAddresses;
                        if (ref.read(selectedAddressProvider) == index) {
                          ref.read(selectedAddressProvider.notifier).state = -1;
                        } else if (ref.read(selectedAddressProvider) > index) {
                          ref.read(selectedAddressProvider.notifier).state--;
                        }
                      }
                    },
                    child: const Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TitleDetailRow(title: 'Name', detail: address['name'] ?? ''),
              // TitleDetailRow(title: 'Phone', detail: address['phone'] ?? ''),
              TitleDetailRow(title: 'Street', detail: address['street'] ?? ''),
              TitleDetailRow(title: 'Building No', detail: address['buildingNo'] ?? ''),
              TitleDetailRow(title: 'City', detail: address['city'] ?? ''),
              // TitleDetailRow(title: 'Country', detail: address['country'] ?? ''),
              // TitleDetailRow(title: 'Landmark', detail: address['landmark'] ?? ''),
            ],
          ),
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget TitleDetailRow({required String title, required String detail}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w300)),
        Text(detail, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}