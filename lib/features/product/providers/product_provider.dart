import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nina_digital/core/services/dio_client.dart';

import '../models/product_detail_model.dart';
import '../repositories/product_repository.dart';

final detailProduct = FutureProvider.autoDispose
    .family<ProductDetailModel, String>((ref, id) async {
  final productRepository = ProductRepository(ref.watch(dioProvider));

  final res = await productRepository.getDetailProduct(id);

  return ProductDetailModel.fromJson(res['data']);
});
