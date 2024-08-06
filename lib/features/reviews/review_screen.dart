import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/shared/mixins/ui_mixins.dart';
import 'package:nina_digital/shared/utils/helper.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/common_widgets/gallery_photo/gallery_photo_view_widget.dart';
import 'add_review_screen.dart';

part 'widgets/review_section_widget.dart';
part 'widgets/review_item_widget.dart';
part 'widgets/assets_review_widged.dart';
part 'widgets/review_filter_list_widget.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'review';
  static const String pathRoute = '/review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _ReviewFilterListWidget(),
              _ReviewSectionWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(AddReviewScreen.nameRoute);
          },
          child: Text('Viết đánh giá',
              style: TextStyle(color: Colors.white, fontSize: 15)),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0A70B8),
              padding: EdgeInsets.symmetric(vertical: 12)),
        ),
      ),
    );
  }
}
