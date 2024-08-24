import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../../core/authentication_user/providers/auth_user_provider.dart';
import '../../../../shared/utils/helper.dart';
import '../../providers/account_provider.dart';
import '../../providers/update_account_provider.dart';

part 'widgets/text_input_widget.dart';

part 'widgets/gender_widget.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static const String nameRoute = 'profile';
  static const String pathRoute = 'profile';

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final formatDate = DateFormat.yMd('vi');

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    final updateAccountState = ref.watch(updateAccountProvider);

    int gender = updateAccountState.gender ?? -1;

    dateController.text = formatDate.format(updateAccountState.birthday != null ? DateTime.fromMillisecondsSinceEpoch(updateAccountState.birthday!) : DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa thông tin'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: 600),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  _TextInputWidget(
                    initValue: updateAccountState.fullname.toString(),
                    hintText: 'Họ tên',
                    onChange: (value) {
                      ref.read(updateAccountProvider.notifier).onChangeFullname(value);
                    },
                  ),
                  _TextInputWidget(
                    initValue: updateAccountState.username.toString(),
                    hintText: 'Nickname',
                    onChange: (value) {
                      ref.read(updateAccountProvider.notifier).onChangeUsername(value);
                    },
                  ),
                  _TextInputWidget(
                    controller: dateController,
                    onChange: () {},
                    icon: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                height: 250,
                                child: ScrollDatePicker(
                                  selectedDate: updateAccountState.birthday != null ? DateTime.fromMillisecondsSinceEpoch(updateAccountState.birthday!) : DateTime.now(),
                                  locale: Locale('en'),
                                  onDateTimeChanged: (DateTime value) {
                                    ref.read(updateAccountProvider.notifier).onChangeBirthDay(value);
                                    dateController.text = formatDate.format(value);
                                  },
                                ),
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              // actionsPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              actions: [
                                FilledButton(
                                    onPressed: () {
                                      // context.pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  _TextInputWidget(
                    initValue: updateAccountState.email.toString(),
                    icon: const Icon(
                      Icons.mail_outline,
                      size: 18,
                      color: Colors.grey,
                    ),
                    onChange: (value) {
                      ref.read(updateAccountProvider.notifier).onChangeEmail(value);
                    },
                  ),
                  _TextInputWidget(
                    initValue: updateAccountState.phone.toString(),
                    onChange: (value){
                      ref.read(updateAccountProvider.notifier).onChangePhone(value);
                    },
                  ),
                  GenderWidget(
                    gender: gender,
                    onChangeGender: (value) {
                      ref.read(updateAccountProvider.notifier).onChangeGender(value);
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _onSubmit();
                  },
                  child: Text(
                    'Cập nhật',
                    style: defaultTextStyle.copyWith(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0A70B8),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Future _onSubmit() async {

    Loading.start();

    final updateAccountState = ref.watch(updateAccountProvider);

    await ref.read(asyncAccountProvider.notifier).updateInfomation(updateAccountState.fullname, updateAccountState.username, updateAccountState.birthday, updateAccountState.email, updateAccountState.phone, updateAccountState.gender);

    Loading.stop();

    context.pop();
  }


  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
  }
}
