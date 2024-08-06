import 'package:nina_digital/features/search/models/product_model.dart';

final products = [
  ProductModel(
      id: '1',
      name: 'Iphone 14 Pro Max',
      price: 35000000,
      newPrice: 29000000,
      image: 'iphone.png'),
  ProductModel(
      id: '2',
      name: 'Iphone 14 Pro Max',
      price: 35000000,
      newPrice: 29000000,
      image: 'iphone.png'),
  ProductModel(
      id: '3',
      name: 'Iphone 14 Pro Max',
      price: 35000000,
      newPrice: 29000000,
      image: 'iphone.png'),
  ProductModel(
      id: '4',
      name: 'Iphone 14 Pro Max',
      price: 35000000,
      newPrice: 29000000,
      image: 'iphone.png'),
  ProductModel(
      id: '5',
      name: 'Iphone 14 Pro Max',
      price: 35000000,
      newPrice: 29000000,
      image: 'iphone.png'),
  ProductModel(
      id: '6',
      name: 'Iphone 14 Pro Max',
      price: 35000000,
      newPrice: 29000000,
      image: 'iphone.png'),
];

List<Map<String, dynamic>> categories = [
  {'title': 'Điện thoại', 'image': 'phone_cat.png'},
  {'title': 'Smartwatch', 'image': 'swatch_cat.png'},
  {'title': 'Smart TV', 'image': 'tv_cat.png'},
  {'title': 'Màn LED', 'image': 'led_cat.png'},
  {'title': 'Laptop', 'image': 'laptop_cat.png'},
  {'title': 'Loa - Tai nghe', 'image': 'mphone_cat.png'},
];

List<Map<String, dynamic>> brands = [
  {'title': 'Iphone'},
  {'title': 'Xiaomi'},
  {'title': 'Oppo'},
  {'title': 'Samsung'},
  {'title': 'Vivo'},
  {'title': 'Pixel'},
];

List<Map<String, dynamic>> orderBy = [
  {'title': 'Phổ biến'},
  {'title': 'Gần đây nhất'},
  {'title': 'Bán chạy'},
  {'title': 'Giá cao'},
  {'title': 'Giá thấp'},
  {'title': 'Giá sốc'},
];
