part of '../review_screen.dart';

class _ReviewItemWidget extends StatelessWidget with UiMixins {
  final ReviewModel model;
  const _ReviewItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<GalleryItem> galleries = [];

    final photoGalleries =  model.photos?.map((photo) => GalleryItem(id: photo.id.toString(), resource: photo.photo.toString())).toList();
    final videoGalleries =  model.videos?.map((video) => GalleryItem(id: video.id.toString(), resource: video.video.toString(), isVideo: true)).toList();

    galleries.addAll(photoGalleries!);
    galleries.addAll(videoGalleries!);


    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                  'assets/images/boy.png',
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.fullname.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  showStar(number: model.star ?? 0, size: 16)
                ],
              )
            ],
          ),
          Text(
            model.title.toString(),
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                color: Colors.grey.shade700),
            maxLines: 5,
          ),
          _AssetsReviewWidget(galleries: galleries),
          SizedBox(
            height: 5,
          ),
          Text(
            DateTime.fromMillisecondsSinceEpoch(model.datePosted ?? 0 * 1000).toString(),
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}


