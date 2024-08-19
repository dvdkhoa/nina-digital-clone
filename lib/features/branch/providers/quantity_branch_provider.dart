import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../models/quantity_branch_model.dart';
import '../repositories/branch_repository.dart';

part 'quantity_branch_provider.g.dart';

@Riverpod(keepAlive: true)
class QuantityBranchNotifier extends _$QuantityBranchNotifier {
  @override
  FutureOr<List<QuantityBranchModel>> build() async {
    return _fetchQuantityBranches();
  }

  Future<List<QuantityBranchModel>> _fetchQuantityBranches() async {
    final branchRepository = BranchRepository(ref.watch(dioProvider));
    final res = await branchRepository.getAllQuantityBranches();
    if(res != null && res['data'] != null) {
      final list = res['data'] as List;
      return list.map((e) => QuantityBranchModel.fromJson(e)).toList();
    }
    return List.empty();
  }
}
