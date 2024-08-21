import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../product/models/ReviewModel.dart';
import '../../product/providers/review_provider.dart';

part 'review_filter_provider.g.dart';

@riverpod
class ReviewFilter extends _$ReviewFilter {
  @override
  List<ReviewModel> build(int productId) {
    return _fetchReview();
  }

  List<ReviewModel> _fetchReview() {
    final reviews = ref.watch(asyncReviewNotifierProvider(productId));

    return reviews.value ?? [];
  }

  void filterProduct(int star) {
    if(star > 0) {
      state = _fetchReview().where((element) => element.star == star,).toList();
    }
    else {
      state = _fetchReview();
    }
  }
}
