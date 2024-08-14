

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../repositories/review_repository.dart';

final addReviewProvider = FutureProvider.autoDispose.family<bool, dynamic>((ref, submitModel ) async {
  final reviewRepository = ReviewRepository(ref.watch(dioProvider));

  final res = reviewRepository.createReview(submitModel.reviewModel, submitModel.files);

  return true;
});