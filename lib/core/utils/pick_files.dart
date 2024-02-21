import 'package:image_picker/image_picker.dart';

class PickerFileService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> image() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<List<XFile>> muiltipleImage(int pickedImgs) async {
    List<XFile> imageList = await _picker.pickMultiImage();
    if (imageList.length > pickedImgs) {
      imageList = imageList.take(pickedImgs).toList();
    }
    return imageList;
  }
}
