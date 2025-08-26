class AppValues {
  static const String appTitle = "ecommerce_app";
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String passwordRegex = r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d@]{6,}$';
  static const String userNameRegex = r'^[a-zA-Z0-9,.-]+$';

  // shared preferences keys
  static const String email = "email";
  static const String userName = "userName";
  static const String cartItemsKey = 'cart_items';
}
