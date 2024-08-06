import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../models/AddressModel.dart';
import '../providers/address_provider.dart';
import '../update_address_screen.dart';

class AddressItem extends ConsumerWidget {
  final AddressModel model;
  const AddressItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              context.pushNamed(UpdateAddressScreen.nameRoute, extra: model);
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
          SlidableAction(
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            onPressed: (BuildContext context) {
              ref
                  .read(asyncAddressNotifierProvider.notifier)
                  .deleteAddress(model.id);
            },
          ),
        ],
      ),

      child: Container(
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
                  Text(
                    model.nameAddress,
                    style: defaultTextStyle.copyWith(fontSize: 15),
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
              model.isDefault != 0
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Color(0xff0A70B8),
            )
          ],
        ),
      ),
    );
  }
}
