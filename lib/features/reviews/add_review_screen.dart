import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:badges/badges.dart' as badges;

import '../../shared/utils/helper.dart';
import '../product/product_detail_screen.dart';

part 'widgets/assets_picker_widget.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'add-review';
  static const String pathRoute = 'add-review';

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
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              Text('Mời bạn chia sẻ thêm cảm nhận'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(),
                ),
              ),
              Text('Gửi ảnh thực tế (tối đa 4 ảnh)'),
              SizedBox(height: 10),
              _AssetsPickerWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ElevatedButton(
          onPressed: () {
            print('add review');
            context.goNamed(ProductDetailScreen.nameRoute,
                pathParameters: {'id': 'fakeId'});
          },
          child: Text('Gửi đánh giá',
              style: TextStyle(color: Colors.white, fontSize: 15)),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0A70B8),
              padding: EdgeInsets.symmetric(vertical: 12)),
        ),
      ),
    );
  }
}
