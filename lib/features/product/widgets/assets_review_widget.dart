part of '../product_detail_screen.dart';

class _AssetsReviewWidget extends StatelessWidget {
  final List<GalleryItem> galleries;
  const _AssetsReviewWidget({Key? key, required this.galleries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !(galleries.length > 0) ? SizedBox() : Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          galleries.length,
          (index) {
            final item = galleries[index];
            return InkWell(
              onTap: () {
                Helper.openGalleryPhoto(context,
                    index: index, galleryItems: galleries);
              },
              child: Container(
                margin: EdgeInsets.only(right: 5),
                child: !galleries[index].isVideo ? CachedNetworkImage(
                  imageUrl: '${ApiUrl.domain}/uploads/reviews/photos/${galleries[index].resource}',
                  width: 80,
                  fit: BoxFit.cover,
                ) : SizedBox(),
              ),
            );
          },
        ),
      ),
    );
  }
}
