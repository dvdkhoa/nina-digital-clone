part of '../add_review_screen.dart';

class _AssetsPickerWidget extends StatefulWidget {
  List<File> images;

  _AssetsPickerWidget({Key? key, required this.images}) : super(key: key);

  @override
  State<_AssetsPickerWidget> createState() => _AssetsPickerWidgetState();
}

class _AssetsPickerWidgetState extends State<_AssetsPickerWidget> {
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
    _images = widget.images;
  }

  _pickImage() async {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () async {
                  await _getMultiFile(ImageSource.gallery);
                  context.pop();
                },
                child: Text(
                  'Thư viện',
                  style: defaultTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              Divider(
                height: 10,
              ),
              TextButton(
                onPressed: () async {
                  await _getFileFromCamera();
                  context.pop();
                },
                child: Text(
                  'Camera',
                  style: defaultTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              Divider(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  'Hủy',
                  style: TextStyle(color: Colors.redAccent, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future _getFileFromCamera() async {
    final file = await Helper.pickImage(ImageSource.camera);
    if (file != null) {
      if (_isValidCountImages(1)) {
        setState(() {
          _images.add(file);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Vui lòng không chọn quá 4 file !'),
          ),
        );
      }
    }
  }

  Future _getMultiFile(ImageSource imageSource) async {
    final xFiles = await Helper.pickMultiImage(imageSource, context);
    if (xFiles != null && xFiles.length > 0) {
      if (_isValidCountImages(xFiles.length)) {
        final files = xFiles.map((file) => File(file.path)).toList();
        setState(() {
          _images.addAll(files);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Vui lòng không chọn quá 4 file !'),
          ),
        );
      }
    }
  }

  void _removeFile(file) {
    setState(() {
      _images.remove(file);
    });
  }

  bool _isValidCountImages(int newQuantity) {
    return (_images.length + newQuantity) <= 4;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(children: [
          ..._images
              .map(
                (file) => ImageItemWidget(
                    file: file,
                  deleteFunc: (file) {
                    _removeFile(file);
                  },
                ),
              )
              .toList(),
          _images.length < 4
              ? GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                  ),
                )
              : SizedBox(),
        ]),
      ),
    );
  }
}

class ImageItemWidget extends StatelessWidget {
  final File file;
  final Function deleteFunc;

  const ImageItemWidget(
      {super.key, required this.file, required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    final mineType = mine.mime(file.path);

    final isVideo = mineType?.startsWith('video') ?? false;

    dynamic uint8list = null;

    if(isVideo) {
      uint8list = VideoThumbnail.thumbnailData(
        video: file.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
        quality: 25,
      );
    }

    return Container(
      margin: EdgeInsets.only(right: 15),
      child: badges.Badge(
        badgeContent: Icon(
          Icons.close,
          color: Colors.white,
          size: 10,
        ),
        onTap: () {
          deleteFunc(file);
        },
        child: !isVideo
            ? Image.file(
                file,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )
            : FutureBuilder(
                future: uint8list,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as Uint8List;
                    return Image.memory(data);
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return Center(
                    child: SpinKitCircle(
                      color: Colors.red,
                      size: 20,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
