import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/authentication_user/providers/auth_user_provider.dart';
import '../../../shared/utils/helper.dart';
import '../providers/filter_provider.dart';
import '../providers/old_keyword_provider.dart';
import '../providers/search_provider.dart';
import 'search_item_widget.dart';

class OldSearchListWidget extends ConsumerWidget {
  final TextEditingController searchController;

  const OldSearchListWidget({Key? key, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authUserProvider.select(
      (value) => value.userLogin?.id,
    ));

    final asyncOldSearchValue = ref.watch(asyncOldKeywordProvider(userId));

    return asyncOldSearchValue.when(
      data: (data) {
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lịch sử tìm kiếm',
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () async {
                      Helper.showAwesomeDialog(
                        dialogType: DialogType.question,
                        title: 'Cảnh báo',
                        desc:
                            'Bạn có chắc chắn muốn xóa tất cả lịch sử tìm kiếm',
                        btnOkOnPress: () async {
                          searchController.text = '';
                          await ref.read(asyncOldKeywordProvider(userId).notifier).deleteAll();
                        },
                        btnCancelOnPress: () {

                        },
                      );
                    },
                    child: const Text(
                      'Xóa tất cả',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 15,
              ),
              ...data
                  .map((item) => InkWell(
                      onTap: () async {
                        searchController.text = item.keyword ?? '';
                        ref
                            .read(filterNotifierProvider.notifier)
                            .changeSearchKeyWord(searchController.text);
                        await ref
                            .read(searchNotifierProvider.notifier)
                            .searchProducts(searchController.text);
                      },
                      child: SearchItemWidget(
                        model: item!,
                      )))
                  .toList()
              // ..._oldSearchs.map((item) => SearchItemWidget(title: item.toString())).toList()
            ],
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const SpinKitCircle(
        size: 20,
        color: Colors.red,
      ),
    );
  }
}

// final _oldSearchs = [
//   'Iphone 14 Pro Max',
//   'Đồng hồ Kieslect Mart',
//   'Smart Tivi Xiaomi',
//   'Máy lọc không khí LG',
//   'Màn hình PC',
//   'Tai nghe Bluetooth',
//   'Camera',
//   'Điện thoại'
// ];
