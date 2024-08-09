class ApiUrl {
  // static const String domain = 'http://nina-digital.com';
  static const String domain = 'http://demo11.ninavietnam.com.vn/nina-digital';
  static const String baseUrl = '$domain/api-app/v1';

  static const String resourcesURL = 'https://vikof.kr/';

  // Media
  static const String uploadUser = '$domain/upload/user';
  static const String uploadPhoto = '$domain/upload/photo';
  static const String uploadProduct = '$domain/upload/product';
  static const String uploadNews = '$domain/upload/news';
  static const String uploadImage = '$domain/upload/images';

  // Authention
  static const String checkToken = '$baseUrl/token/check';
  static const String refreshToken = '$baseUrl/token/refresh';
  static const String signIn = '$baseUrl/account/sign-in';
  static const String signUp = '$baseUrl/account/sign-up';
  static const String forgotPassword = '$baseUrl/account/forgot-password';

  // PRODUCT - API
  static const String PRODUCT = '$baseUrl/product';
  static const String PRODUCT_CATEGORY = '$baseUrl/product/categories';
  static const String FAVORITE_PRODUCT = '$baseUrl/product-favorite';

  // NEWS - API
  static const String NEWS = '$baseUrl/news';

  // Photo - API
  static const String PHOTO = '$baseUrl/photos';

  static const String ACCOUNT_ID = '67';
  static const String ACCOUNT = '$baseUrl/account';

  static const String ADDRESS = '$baseUrl/address';

  static const String PROMOTION = '$baseUrl/promotion';

  static const String ORDER = '$baseUrl/orders';
  static const String CREATE_ORDER = '$baseUrl/orders/create-order';
  static const String ORDER_STATUS = '$baseUrl/orders/status';

  static const String CART = '$baseUrl/cart';
}
