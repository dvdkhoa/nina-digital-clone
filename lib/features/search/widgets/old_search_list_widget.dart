import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/authentication_user/providers/auth_user_provider.dart';
import '../providers/old_keyword_provider.dart';
import 'search_item_widget.dart';

class OldSearchListWidget extends ConsumerWidget {
  const OldSearchListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userId = ref.watch(authUserProvider.select((value) => value.userLogin?.id,));

    final asyncOldSearchValue = ref.watch(asyncOldKeywordProvider(userId));

    return asyncOldSearchValue.when(data: (data) {
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
                  'Hôm nay',
                  style: TextStyle(fontSize: 15),
                ),
                InkWell(
                  onTap: () {
                    print('Xóa');
                    // ref.read(filterNotifierProvider.notifier).changeSearchKeyWord(null);
                    // setState(() {});
                  },
                  child: const Text(
                    'Xóa tất cả',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            const Divider(height: 15,),
            // ...data.map((item) => SearchItemWidget(title: item?.keyword ?? '')).toList()
            ..._oldSearchs.map((item) => SearchItemWidget(title: item.toString())).toList()

          ] ,
        ),
      );
    }, error: (error, stackTrace) => Center(child: Text(error.toString()),), loading: () => const SpinKitCircle(size: 20, color: Colors.red,),);
  }
}

final _oldSearchs = [
  'Iphone 14 Pro Max',
  'Đồng hồ Kieslect Mart',
  'Smart Tivi Xiaomi',
  'Máy lọc không khí LG',
  'Màn hình PC',
  'Tai nghe Bluetooth',
  'Camera',
  'Điện thoại'
];
