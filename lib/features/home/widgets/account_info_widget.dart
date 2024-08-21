part of '../home_screen.dart';

class AccountInfoWidget extends ConsumerWidget implements PreferredSizeWidget{
  const AccountInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    final asyncAccountInfo = ref.watch(asyncAccountProvider);

    final totalQuantityCart =
        ref.watch(cartProvider.select((value) => value.total));

    return asyncAccountInfo.when(
      data: (data) {
        return AppBar(
          automaticallyImplyLeading: true,
          leadingWidth: 70,
          leading: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Container(
              width: double.infinity,
              child: CircleAvatar(
                child: CachedNetworkImage(
                  imageUrl: '${ApiUrl.domain}/uploads/users/${data?.avatar}',
                  placeholder: (context, url) => Center(child: SpinKitCircle(size: 20, color: Colors.red,),),
                  errorWidget: (context, url, error) => Image.asset('assets/images/boy.png'),
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Container(
            // padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning',
                  style: defaultTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  data?.fullname ?? 'Tài khoản',
                  style: defaultTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(NotificationScreen.nameRoute);
              },
              icon: icons.Bell(
                width: 20,
                height: 20,
                color: defaultTextStyle.color,
              ),
            ),
            CartIconWidget(
                totalQuantityCart: totalQuantityCart,
                defaultTextStyle: defaultTextStyle)
          ],
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => Center(
        child: SpinKitCircle(
          color: Colors.red,
          size: 20,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => Size.fromHeight(50.0);

}
