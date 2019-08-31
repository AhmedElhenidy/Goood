class DataBaseConstants {
  //category table constants
  static const String CATEGORY_TABLE = "category";
  static const String CATEGORY_TABLE_ID = "id";
  static const String CATEGORY_TABLE_NAME = "name";
  static const String CATEGORY_TABLE_IMAGE = "Image";

  // product table Constants
  static const String PRODUCT_TABLE = "product";
  static const String PRODUCT_TABLE_ID = "id";
  static const String PRODUCT_TABLE_NAME = "name";
  static const String PRODUCT_TABLE_PRICE = "price";
  static const String PRODUCT_TABLE_IMAGE = "image";
  static const String PRODUCT_TABLE_CATEGORY = CATEGORY_TABLE;

  //wish List Table Constants
  static const String WISH_LIST_TABLE = "wishList" ;
  static const String WISH_LIST_TABLE_ID = "id" ;
  static const String WISH_LIST_TABLE_PRODUCT_ID = PRODUCT_TABLE ;

  //shopping cart table Constants
  static const String  SHOPPING_CART_TABLE = "shoppingCart" ;
  static const String  SHOPPING_CART_TABLE_ID = "id" ;
  static const String  SHOPPING_CART_TABLE_PRODUCT_ID = PRODUCT_TABLE ;
  static const String  SHOPPING_CART_TABLE_PRODUCT_QTY = "quantity" ;

  //shopping cart specification table Constants
  static const String  SHOPPING_CART_SPECIFICATION_TABLE = "shoppingCartSpecification" ;
  static const String  SHOPPING_CART_SPECIFICATION_TABLE_ID = "id" ;
  static const String  SHOPPING_CART_SPECIFICATION_TABLE_SHOPPING_ID = SHOPPING_CART_TABLE ;
  static const String  SHOPPING_CART_SPECIFICATION_TABLE_KEY = "key" ;
  static const String  SHOPPING_CART_SPECIFICATION_TABLE_VALUE = "value" ;


}
