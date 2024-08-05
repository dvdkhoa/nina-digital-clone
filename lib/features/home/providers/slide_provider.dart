import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nina_digital/core/services/dio_client.dart';
import 'package:nina_digital/features/home/models/news_model.dart';
import 'package:nina_digital/features/home/repositories/photo_repository.dart';

final allSlides = FutureProvider.autoDispose<List<NewsModel>>((ref) async {
  final productRepository = PhotoRepository(ref.watch(dioProvider));

  final res = await productRepository.fetchSlides();


  final list = res['data'] as List;

  final news_list = list.map((item) => NewsModel.fromJson(item)).toList();

  return news_list;
});
