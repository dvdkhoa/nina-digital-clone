import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../shared/constants/api_url.dart';
import '../../shared/utils/helper.dart';
import 'models/district_model.dart';
import 'models/mock_model.dart';
import 'providers/branch_provider.dart';
import 'providers/city_provider.dart';
import 'providers/district_provider.dart';
import 'providers/quantity_branch_provider.dart';

part 'widgets/city_select_widget.dart';
part 'widgets/district_select_widget.dart';
part 'widgets/branch_result_widget.dart';
part 'widgets/custom_list_tile_widget.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'branchs';
  static const String pathRoute = '/branchs';

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  List branches = [];


  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
                margin: EdgeInsets.only(left: 25),
                child: Image.asset('assets/images/g22.png')),
            title: Text(
              'Hệ thống chi nhánh',
              style:
                  defaultTextStyle.copyWith(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: Colors.black45,
            pinned: true,
            floating: true,
            stretch: true,
            onStretchTrigger: () async {
              print('stretch');
            },
            expandedHeight: 370,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              title: LayoutBuilder(builder: (context, constraints) {
                var dynamicHeight = constraints.maxHeight;
                return AnimatedOpacity(
                  opacity: (dynamicHeight > 160) ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'HỆ THỐNG CỦA DIGITAL',
                          overflow: TextOverflow.fade,
                          style: defaultTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: switch (dynamicHeight) {
                                250 => 15,
                                200 => 13,
                                _ => dynamicHeight > 250 ? 15 : 12,
                              }),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tính đến hiện tại, chuỗi hệ thống Digital có 20 chi nhánh tại những vị trí đắc địa nhất Tp. Hồ Chí Minh và các tỉnh lân cận. Hãy tìm kiếm đến chi nhanh gần bạn để trải nghiệm chúng tôi',
                          style: defaultTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: switch (dynamicHeight) {
                              250 => 10,
                              200 => 9,
                              _ => dynamicHeight > 250 ? 10 : 8,
                            },
                            height: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }),
              background: Image.asset(
                'assets/images/bg_branch_none.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/icon-navigation.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'TÌM KIẾM GẦN BẠN',
                            style: defaultTextStyle.copyWith(
                                fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff0A70B8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10)),
                    ),
                  ),
                  CitySelectWidget(),
                  DistrictSelectWidget(),
                  BranchResultWidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _normalInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent),
    borderRadius: BorderRadius.all(Radius.circular(8)));

const _enableInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff3C3C3C)),
    borderRadius: BorderRadius.all(Radius.circular(8)));






// Text(
//                       'HỆ THỐNG CỦA DIGITAL',
//                       style: defaultTextStyle.copyWith(
//                           fontSize: 16, color: Colors.white),
//                     ),
//                     Text(
//                       'Tính đến hiện tại, chuỗi hệ thống Digital có 20 chi nhánh tại những vị trí đắc địa nhất Tp. Hồ Chí Minh và các tỉnh lân cận. Hãy tìm kiếm đến chi nhanh gần bạn để trải nghiệm chúng tôi',
//                       style: defaultTextStyle.copyWith(
//                           fontSize: 10, color: Colors.white),
//                     )