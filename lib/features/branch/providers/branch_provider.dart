import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../models/branch_model.dart';
import '../repositories/branch_repository.dart';

part 'branch_provider.g.dart';

@Riverpod(keepAlive: false)
class AsyncBranchNotifier extends _$AsyncBranchNotifier {
  @override
  FutureOr<List<BranchModel>> build() async {
    return [];
  }

  Future fetchBranches({ int? cityId, int? districtId }) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        final branchRepository = BranchRepository(ref.watch(dioProvider));
        final res = await branchRepository.fetchBranches(cityId, districtId);
        if (res != null && res['data'] != null) {
          final list = res['data'] as List;
          return list.map((e) => BranchModel.fromJson(e)).toList();
        }
        return List.empty();
      },
    );
  }
}
