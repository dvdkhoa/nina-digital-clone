import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:go_router/go_router.dart';
import 'package:nina_digital/features/reviews/review_screen.dart';
// import 'package:nina_digital/shared/common_widgets/gallery_item_view_widget.dart';
import 'package:nina_digital/shared/constants/api_url.dart';
import 'package:nina_digital/shared/utils/helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../shared/common_widgets/gallery_photo/gallery_photo_view_widget.dart';
import '../../shared/extensions/string_ext.dart';
import '../../shared/mixins/ui_mixins.dart';
import '../cart/providers/cart_provider.dart';
import 'models/product_detail_model.dart';
import 'providers/product_provider.dart';

part './widgets/review_section_widget.dart';
part './widgets/review_item_widget.dart';
part './widgets/assets_review_widget.dart';
part './widgets/product_desc_widget.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String productId;
  ProductDetailScreen({Key? key, required this.productId}) : super(key: key);

  static const String nameRoute = 'product-detail';
  static const String pathRoute = 'product/:id';

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int _activeIndex = 0;

  int _colorActiveIndex = 0;

  int _quantity = 1;

  void changeColor(index) {
    setState(() {
      _colorActiveIndex = index;
    });
  }

  _showCusDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Thông báo',
      desc: 'Thêm sản phẩm vào giỏ hàng thành công',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
      btnOkText: 'Giỏ hàng',
      btnCancelText: 'Hủy bỏ',
    )..show();
  }

  List<Widget> _productColorsWidget(List<Thuoctinh> attributes, int index) {
    List<Widget> list = [];
    for (int i = 0; i < attributes.length; i++) {
      if (i == index) {
        list.add(_productByColorWidget(
          active: true,
          onSelect: () => changeColor(i),
          attr: attributes[i],
        ));
      } else {
        list.add(_productByColorWidget(
          active: false,
          onSelect: () => changeColor(i),
          attr: attributes[i],
        ));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final asyncProductDetail = ref.watch(detailProduct(widget.productId));

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: asyncProductDetail.when(
            data: (data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 1 / 2,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _activeIndex = index;
                          });
                        },
                      ),
                      items: data.gallery.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.network(
                              // 'assets/images/$image',
                              '${ApiUrl.resourcesURL}/upload/product/${item.photo}',
                              fit: BoxFit.fitHeight,
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: AnimatedSmoothIndicator(
                        count: data.gallery.length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.black,
                          dotColor: Colors.grey,
                          dotHeight: 5,
                          dotWidth: 5,
                        ),
                        activeIndex: _activeIndex,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(data.namevi.toString())),
                      IconButton(
                        onPressed: () {
                          print('Liked');
                        },
                        icon: Icon(
                          Icons.favorite_outline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/star.svg'),
                      const Text(
                        '4.5 |',
                        style: TextStyle(fontSize: 13),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xffE7E7E7),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: const Text(
                          'Đã bán 8,374',
                          style: TextStyle(fontSize: 11),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        data.salePrice!.formattedVNDCustom(),
                        style:
                            TextStyle(fontSize: 18, color: Color(0xffE82727)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          data.regularPrice!.formattedVNDCustom(),
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff181818),
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(height: 5),
                  const SizedBox(
                    height: 10,
                  ),
                  // const Text(
                  //   'Màu sắc : Gold',
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    height: 40,
                    width: double.infinity,
                    child: ListView(
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: _productColorsWidget(
                          data.thuoctinh, _colorActiveIndex),
                    ),
                  ),
                  ProductDescWidget(desc: data.descvi),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xff171717))),
                    alignment: Alignment.center,
                    child: const Text.rich(TextSpan(
                        text: 'Gọi đặt mua ',
                        style: TextStyle(fontSize: 13),
                        children: [
                          TextSpan(
                              text: '0987.654.321',
                              style: TextStyle(color: Color(0xff0A70B8))),
                          TextSpan(text: '(7:30 - 22:00)')
                        ])),
                  ),
                  _ReviewSectionWidget(),
                ],
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString() + stackTrace.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Text('Số lượng'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_quantity != 1) _quantity -= 1;
                            });
                          },
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text(
                          _quantity.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _quantity += 1;
                            });
                          },
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xffE8E8E8),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () async {
                      final loading = Loading(context);
                      loading.start();

                      final result = await ref
                          .read(cartProvider.notifier)
                          .addToCart(int.parse(widget.productId), _quantity);

                      await loading.stop();

                      if (result) {
                        _showCusDialog();
                      } else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Thông báo',
                          desc: 'Thêm sản phẩm vào giỏ hàng thất bại',
                          btnCancelOnPress: () {},
                        )..show();
                      }
                    },
                    label: Text('Thêm vào giỏ hàng',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0A70B8),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _productByColorWidget(
    {required Thuoctinh attr,
    required bool active,
    required Function onSelect}) {
  return InkWell(
    onTap: () {
      onSelect();
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // child: Image.network('${ApiUrl.resourcesURL}/upload/product/$photo'),
      child: Text(attr.color.toString()),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: active == true ? Colors.black : Color(0xffEFEFEF))),
    ),
  );
}
