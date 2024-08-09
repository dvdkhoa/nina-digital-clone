import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../shared/common_widgets/item_checked_widget.dart';
import '../promotion/models/mock_model.dart';
import 'models/promotion_model.dart';
import 'providers/promotion_provider.dart';
import 'widgets/promotion_item_widget.dart';

class PromotionScreen extends ConsumerStatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'promotion';
  static const String pathRoute = 'promotion';

  @override
  ConsumerState<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends ConsumerState<PromotionScreen> {
  PromotionModel? _promotion;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    final asyncPromotionValue = ref.watch(asyncPromotionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm mã khuyến mãi'),
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: asyncPromotionValue.when(
            data: (data) {
              return Column(
                children: data
                    .map(
                      (promotion) => InkWell(
                        onTap: () {
                          setState(() {
                            _promotion = promotion;
                          });
                        },
                        child: PromotionItemWidget(
                          title: promotion?.name ?? '',
                          desc: promotion?.desc ?? '',
                          isChecked: _promotion?.id == promotion.id,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
            error: (error, stackTrace) =>
                Center(child: Text(stackTrace.toString())),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(color: Colors.white, boxShadow: []),
        child: ElevatedButton(
          child: Text(
            'Apply',
            style: defaultTextStyle.copyWith(fontSize: 15, color: Colors.white),
          ),
          onPressed: () {
            context.pop(_promotion);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A70B8)),
        ),
      ),
    );
  }
}
