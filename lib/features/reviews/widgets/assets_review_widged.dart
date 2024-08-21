part of '../review_screen.dart';

class _AssetsReviewWidget extends StatelessWidget {
  final List<GalleryItem> galleries;

  const _AssetsReviewWidget({Key? key, required this.galleries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !(galleries.length > 0)
        ? SizedBox()
        : Container(
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
                      child: !galleries[index].isVideo
                          ? CachedNetworkImage(
                              imageUrl:
                                  '${ApiUrl.domain}/uploads/reviews/photos/${galleries[index].resource}',
                              placeholder: (context, url) => Center(
                                child: SpinKitCircle(
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.asset('assets/images/error.png'),
                              width: 80,
                              fit: BoxFit.cover,
                            )
                          // : VideoThumbnailWidget(videoPath: '${ApiUrl.domain}/uploads/reviews/videos/${galleries[index].resource}'),
                          : Image.asset('assets/images/video-placeholder.png'),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
