// Providers
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Providers
final addressListProvider = StateProvider<List<Map<String, String>>>((ref) => []);
final selectedAddressProvider = StateProvider<int>((ref) => -1);
final isAddingNewAddressProvider = StateProvider<bool>((ref) => false);
final editingAddressIndexProvider = StateProvider<int?>((ref) => null);