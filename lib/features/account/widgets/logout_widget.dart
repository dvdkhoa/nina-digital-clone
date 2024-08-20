part of '../acount_screen.dart';

class _LogOutWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useRootNavigator: true,
          context: context,
          builder: (context) {
            return Wrap(
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'Đăng xuất',
                        style: TextStyle(fontSize: 20),
                      ),
                      Divider(
                        height: 20,
                      ),
                      Text('Bạn có chắc chắn muốn thoát'),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text(
                                'Hủy',
                                style: defaultTextStyle,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffE7E7E7),
                                  padding: EdgeInsets.symmetric(vertical: 15)),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ref.read(authUserProvider.notifier).signOut();
                                context.pop();
                              },
                              child: Text(
                                'Đồng ý',
                                style: defaultTextStyle.copyWith(
                                    color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0a70b8),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Đăng xuất',
              style: TextStyle(fontFamily: 'UTM-Avo', color: Color(0xffE91616)),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 13,
            )
          ],
        ),
      ),
    );
  }
}
