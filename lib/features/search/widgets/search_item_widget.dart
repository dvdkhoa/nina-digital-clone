import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../core/authentication_user/providers/auth_user_provider.dart';
import '../../../local_storage/schema/old_search.dart';
import '../providers/old_keyword_provider.dart';

class SearchItemWidget extends ConsumerWidget {
  final OldSearch model;
  const SearchItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.keyword!,
            style: TextStyle(color: Color(0xff757575), fontSize: 13),
          ),
          InkWell(
              onTap: () async {
                final userInfo = ref.watch(authUserProvider.select((value) => value.userLogin,));
                await ref.read(asyncOldKeywordProvider(userInfo?.id).notifier).delete(model);
              },
              child: SvgPicture.asset('assets/icons/delete-search.svg'))
        ],
      ),
    );
  }
}
