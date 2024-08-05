part of '../add_review_screen.dart';

class _AssetsPickerWidget extends StatefulWidget {
  const _AssetsPickerWidget({Key? key}) : super(key: key);

  @override
  State<_AssetsPickerWidget> createState() => _AssetsPickerWidgetState();
}

class _AssetsPickerWidgetState extends State<_AssetsPickerWidget> {
  List<File> _images = [];

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
                onPressed: () {
                  _getMultiFile(ImageSource.gallery);
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
                onPressed: () {
                  _getFileFromCamera();
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

  void _getFileFromCamera() async {
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

  void _getMultiFile(ImageSource imageSource) async {
    final xFiles = await Helper.pickMultiImage(imageSource);
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
          ...ImageListWidget(_images, _removeFile),
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

List<Widget> ImageListWidget(List<File> imageFiles, Function deleteFunc) {
  return imageFiles
      .map((item) => Container(
            margin: EdgeInsets.only(right: 15),
            child: badges.Badge(
              badgeContent: Icon(
                Icons.close,
                color: Colors.white,
                size: 10,
              ),
              onTap: () {
                deleteFunc(item);
              },
              child: Image.file(
                item,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ))
      .toList();
}
