import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/authentication_user/providers/auth_user_provider.dart';
import '../../../core/services/dio_client.dart';
import '../models/promotion_model.dart';
import '../repositories/promotion_repository.dart';

part 'promotion_provider.g.dart';

@Riverpod(keepAlive: false)
class AsyncPromotionNotifier extends _$AsyncPromotionNotifier {
  @override
  FutureOr<List<PromotionModel>> build() {
    return _fetchPromotions();
  }

  Future<List<PromotionModel>> _fetchPromotions() async {
    final userInfo = ref.watch(authUserProvider.select(
      (value) => value.userLogin,
    ));

    final promotionRepository = PromotionRepository(ref.watch(dioProvider));

    final res = await promotionRepository.fetchPromotion(userInfo?.id);

    if (res['data'] != null) {
      final list = res['data'] as List;
      final promotions = list.map((e) => PromotionModel.fromJson(e)).toList();

      return promotions;
    }
    return List.empty();
  }
}
