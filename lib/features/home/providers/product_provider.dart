import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../models/product_model.dart';
import '../repositories/product_repository.dart';

final productListProvider = FutureProvider.autoDispose((ref) async {
  final productRepository = ProductRepository(ref.watch(dioProvider));

  return productRepository.fetchProducts();
});
