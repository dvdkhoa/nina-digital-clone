part of '../acount_screen.dart';

class AccountInfoWidget extends ConsumerWidget {
  const AccountInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAccountInfo = ref.watch(asyncAccountProvider);
    // ref.watch(authUserProvider.select((value) => value.userLogin));

    return asyncAccountInfo.when(
      data: (data) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            badges.Badge(
              badgeContent: Icon(
                Icons.photo_camera,
                size: 10,
              ),
              position: badges.BadgePosition.bottomEnd(),
              onTap: () {
                _showCustomModelBottomSheet(context: context, ref: ref);
              },
              badgeStyle: badges.BadgeStyle(badgeColor: Colors.grey.shade300),
              child: ClipOval(
                child: !Helper.isNull(data?.avatar)
                    ? CachedNetworkImage(
                        imageUrl:
                            '${ApiUrl.domain}/uploads/users/${data?.avatar}',
                        placeholder: (context, url) =>
                            // Image.asset('assets/images/placeholder.jpg'),
                            SpinKitCircle(size: 20, color: Colors.red),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/images/boy.png'),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/boy.png',
                        width: 50, height: 50, fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.fullname ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(data?.email ?? ''),
                  Text(data?.phone ?? '')
                ],
              ),
            ),
            Container(
              width: 22,
              height: 22,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.pushNamed(ProfileScreen.nameRoute);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 15,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xff0A70B8),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  )),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: SpinKitCircle(
          size: 20,
          color: Colors.red,
        ),
      ),
    );
  }

  void _showCustomModelBottomSheet(
      {required BuildContext context, required WidgetRef ref}) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Helper.pickImage(ImageSource.camera);
              },
              child: const ListTile(
                title: Center(child: Text('Camera')),
              ),
            ),
            const Divider(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                final file = await Helper.pickImage(ImageSource.gallery);
                if (file != null) {
                  // Loading(context).start();
                  await ref
                      .read(asyncAccountProvider.notifier)
                      .changeAvatar(file);
                  context.pop();
                }
              },
              child: const ListTile(
                title: Center(child: Text('Thư viện ảnh')),
              ),
            ),
            const Divider(
              height: 10,
            ),
            InkWell(
              onTap: () => context.pop(),
              child: ListTile(
                title: Center(
                    child:
                        Text('Hủy', style: TextStyle(color: Colors.redAccent))),
              ),
            ),
          ],
        ));
      },
    );
  }
}
