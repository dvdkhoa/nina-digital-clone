part of '../branch_screen.dart';

class _customListTile extends StatelessWidget {
  final String image;
  final String desc;
  final String phoneNumber;
  final String link_google_map;

  _customListTile(
      {Key? key, required String this.image, required String this.desc, required this.phoneNumber, required this.link_google_map})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => SpinKitCubeGrid(
                  size: 20, color: Colors.red,
                ),
                errorWidget: (context, url, error) => Image.asset('assets/images/quangtrung.png'),
                width: 70,
              ),
              SizedBox(
                width: 18,
              ),
              Expanded(child: Text(desc))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  Helper.callPhone(number: phoneNumber);
                },
                label: Text(
                  'Hotline',
                  style: defaultTextStyle.copyWith(
                      fontSize: 13, color: Colors.black),
                ),
                icon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(6))),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton.icon(
                onPressed: () {
                  Helper.openGoogleMap(link_google_map);
                },
                label: Text(
                  'Chỉ đường',
                  style: defaultTextStyle.copyWith(
                      fontSize: 13, color: Colors.black),
                ),
                icon: Icon(
                  Icons.navigation,
                  color: Colors.black,
                ),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(6))),
              )
            ],
          )
        ]));
  }
}