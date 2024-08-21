import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:badges/badges.dart' as badges;
import 'package:mime_type/mime_type.dart' as mine;
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../shared/utils/helper.dart';
import '../product/models/ReviewModel.dart';
import '../product/providers/review_provider.dart';

part 'widgets/assets_picker_widget.dart';

class AddReviewScreen extends ConsumerStatefulWidget {
  final int productId;
  AddReviewScreen({Key? key, required this.productId,}) : super(key: key);

  static const String nameRoute = 'add-review';
  static const String pathRoute = 'add-review';

  @override
  ConsumerState<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends ConsumerState<AddReviewScreen> {
  TextEditingController contentEditController = TextEditingController();

  int _rating = 1;

  List<File> _images = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá sản phẩm'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đánh giá cho sản phẩm Iphone 14 Pro Max 256GB',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    _rating = rating.round();
                  },
                ),
              ),
              Text('Mời bạn chia sẻ thêm cảm nhận'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: contentEditController ,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(),
                ),
              ),
              Text('Gửi ảnh thực tế (tối đa 4 ảnh)'),
              SizedBox(height: 10),
              _AssetsPickerWidget(images: _images,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ElevatedButton(
             onPressed: _submit,
          child: Text('Gửi đánh giá',
              style: TextStyle(color: Colors.white, fontSize: 15)),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0A70B8),
              padding: EdgeInsets.symmetric(vertical: 12)),
        ),
      ),
    );
  }

  void _submit() async {

    if(Helper.isNull(contentEditController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Vui lòng nhập cảm nhận trước khi gửi đánh giá')));
      return;
    }

    final userInfo = ref.read(authUserProvider.select((value)=>value.userLogin));
    ReviewModel model = ReviewModel(
      fullname: userInfo?.fullname,
      email: userInfo?.email,
      idVariant: widget.productId,
      type: 'san-pham',
      phone: userInfo?.phone,
      title: contentEditController.text,
      content: contentEditController.text,
      star: _rating,
      poster: userInfo?.avatar,
    );

    ref.read(asyncReviewNotifierProvider(widget.productId).notifier).createReview(model, _images);

    context.pop();
  }
}
