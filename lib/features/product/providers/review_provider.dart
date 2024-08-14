import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/dio_client.dart';
import '../models/ReviewModel.dart';
import '../repositories/review_repository.dart';

part 'review_provider.g.dart';

@Riverpod(keepAlive: false)
class AsyncReviewNotifier extends _$AsyncReviewNotifier {
  @override
  FutureOr<List<ReviewModel>> build(int productId) async {
    return fetchReviews(productId);
  }

  Future<List<ReviewModel>> fetchReviews(productId) async {
    final reviewRepository = ReviewRepository(ref.watch(dioProvider));

    final res = await reviewRepository.getAllReviewByProductId(productId);
    if(res['data'] != null) {
      final list = res['data'] as List;
      final reviews = list.map((item)=>ReviewModel.fromJson(item)).toList();
      return reviews;
    }
    return List.empty();
  }

  Future<bool> createReview(ReviewModel model, List<File> files) async {
    final reviewRepository = ReviewRepository(ref.watch(dioProvider));

    final res = await reviewRepository.createReview(model, files);

    if(res != null && res['data'] != null) {
      return true;
    }
    return false;
  }
}

