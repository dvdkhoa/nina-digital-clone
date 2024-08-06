import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/dio_client.dart';
import 'models/account_model.dart';
import 'repositories/account_repository.dart';

class AccountNotifier
    extends AutoDisposeFamilyAsyncNotifier<AccountModel, String> {
  @override
  FutureOr<AccountModel> build(String id) async {
    return _getInfoAccount(id);
  }

  Future<AccountModel> _getInfoAccount(String id) async {
    final accountRepository = await AccountRepository(ref.watch(dioProvider));

    final res = await accountRepository.getInfo(id);

    return AccountModel.fromJson(res['data']);
  }

  Future<void> setInfoAccount(String id) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return _getInfoAccount(id);
    });
  }
}

final asyncAccountProvider = AsyncNotifierProvider.autoDispose
    .family<AccountNotifier, AccountModel, String>(AccountNotifier.new);
