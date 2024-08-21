import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:nina_digital/shared/mixins/ui_mixins.dart';
import 'package:nina_digital/shared/utils/helper.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../shared/common_widgets/gallery_photo/gallery_photo_view_widget.dart';
import '../../shared/common_widgets/video_thumbnail_widget.dart';
import '../../shared/constants/api_url.dart';
import '../product/models/ReviewModel.dart';
import '../product/providers/review_provider.dart';
import 'add_review_screen.dart';
import 'providers/review_filter_provider.dart';

part 'widgets/review_section_widget.dart';

part 'widgets/review_item_widget.dart';

part 'widgets/assets_review_widged.dart';

part 'widgets/review_filter_list_widget.dart';

class ReviewScreen extends ConsumerWidget {
  final int productId;

  const ReviewScreen({Key? key, required this.productId}) : super(key: key);

  static const String nameRoute = 'review';
  static const String pathRoute = '/review';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));

    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _ReviewFilterListWidget(
                productId: productId,
              ),
              _ReviewSectionWidget(
                productId: productId,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: userInfo != null
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed(AddReviewScreen.nameRoute,
                      queryParameters: {'id_product': productId.toString()});
                },
                child: Text('Viết đánh giá',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0A70B8),
                    padding: EdgeInsets.symmetric(vertical: 12)),
              ),
            )
          : const SizedBox(height: 20,),
    );
  }
}
