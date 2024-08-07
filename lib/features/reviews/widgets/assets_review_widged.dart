part of '../review_screen.dart';

class _AssetsReviewWidget extends StatelessWidget {
  const _AssetsReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          galleryItems.length,
          (index) {
            final item = galleryItems[index];
            return InkWell(
              onTap: () {
                Helper.openGalleryPhoto(context,
                    index: index, galleryItems: galleryItems);
              },
              child: Container(
                margin: EdgeInsets.only(right: 5),
                child: Image.asset(
                  item.resource,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final List<GalleryItem> galleryItems = [
  GalleryItem(
    id: '1',
    resource: 'assets/images/new4.png',
  ),
  GalleryItem(
    id: '2',
    resource: 'assets/images/new4.png',
  ),
  GalleryItem(
    id: '3',
    resource: 'assets/images/new4.png',
  ),
  GalleryItem(
    id: '4',
    resource: 'assets/images/new4.png',
  ),
];
