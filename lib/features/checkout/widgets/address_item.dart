import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../address/models/AddressModel.dart';

class AddressItem extends ConsumerWidget {
  final AddressModel model;
  final bool isChecked;
  const AddressItem({Key? key, required this.model, this.isChecked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(149, 157, 165, 0.2),
              blurRadius: 24,
              spreadRadius: 0,
              offset: Offset(
                0,
                8,
              ),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xffEAF5FD), shape: BoxShape.circle),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color(0xff0A70B8), shape: BoxShape.circle),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        model.nameAddress,
                        style: defaultTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    model.isDefault == 1
                        ? Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                'Mặc định',
                                style: defaultTextStyle.copyWith(fontSize: 12),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  model.detailAddress,
                  style: defaultTextStyle.copyWith(
                      fontSize: 10, color: Color(0xff686868)),
                )
              ],
            ),
          ),
          Icon(
            isChecked
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: Color(0xff0A70B8),
          )
        ],
      ),
    );
  }
}
