import 'package:camel/statics/DataBaseConstants.dart';
import 'package:sqlcool/sqlcool.dart';

Db db = Db();

Future<void> initDb() async {
// define the tables
  DbTable category = DbTable(DataBaseConstants.CATEGORY_TABLE)
    ..varchar(DataBaseConstants.CATEGORY_TABLE_NAME)
    ..varchar(DataBaseConstants.CATEGORY_TABLE_IMAGE, nullable: false)
    ..index(DataBaseConstants.CATEGORY_TABLE_ID);
  DbTable product = DbTable(DataBaseConstants.PRODUCT_TABLE)
    ..varchar(DataBaseConstants.PRODUCT_TABLE_IMAGE)
    ..varchar(DataBaseConstants.PRODUCT_TABLE_NAME, unique: true)
    ..integer(DataBaseConstants.PRODUCT_TABLE_PRICE)
    ..foreignKey(DataBaseConstants.PRODUCT_TABLE_CATEGORY,
        onDelete: OnDelete.cascade)
    ..index(DataBaseConstants.PRODUCT_TABLE_ID);
  DbTable wishList = DbTable(DataBaseConstants.WISH_LIST_TABLE)
    ..index(DataBaseConstants.WISH_LIST_TABLE_ID)
    ..foreignKey(DataBaseConstants.WISH_LIST_TABLE_PRODUCT_ID);
  DbTable shoppingCart = DbTable(DataBaseConstants.SHOPPING_CART_TABLE)
    ..index(DataBaseConstants.SHOPPING_CART_TABLE_ID)
    ..integer(DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_QTY)
    ..foreignKey(DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_ID);
  DbTable shoppingCartSpecification =
      DbTable(DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE)
        ..index(DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_ID)
        ..foreignKey(
            DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_SHOPPING_ID ,onDelete: OnDelete.cascade)
        ..varchar(DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_KEY)
        ..varchar(DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_VALUE);
// prepare the queries
  List<String> populateQueries = <String>[
    //Category Hashy with it'd Static Products
    'INSERT INTO ${DataBaseConstants.CATEGORY_TABLE}(${DataBaseConstants.CATEGORY_TABLE_NAME},${DataBaseConstants.CATEGORY_TABLE_IMAGE}) VALUES("الحاشي","camel.png")',
    'INSERT INTO ${DataBaseConstants.PRODUCT_TABLE}(${DataBaseConstants.PRODUCT_TABLE_NAME},${DataBaseConstants.PRODUCT_TABLE_IMAGE},${DataBaseConstants.PRODUCT_TABLE_PRICE},${DataBaseConstants.PRODUCT_TABLE_CATEGORY}) VALUES("حور" ,"images/hwar.png",150 ,1)',
    'INSERT INTO ${DataBaseConstants.PRODUCT_TABLE}(${DataBaseConstants.PRODUCT_TABLE_NAME},${DataBaseConstants.PRODUCT_TABLE_IMAGE},${DataBaseConstants.PRODUCT_TABLE_PRICE},${DataBaseConstants.PRODUCT_TABLE_CATEGORY}) VALUES("لبانى" ,"images/lpany.png",150 ,1)',
    'INSERT INTO ${DataBaseConstants.PRODUCT_TABLE}(${DataBaseConstants.PRODUCT_TABLE_NAME},${DataBaseConstants.PRODUCT_TABLE_IMAGE},${DataBaseConstants.PRODUCT_TABLE_PRICE},${DataBaseConstants.PRODUCT_TABLE_CATEGORY}) VALUES("مفرود" ,"images/mafrood.png",150 ,1)',
    'INSERT INTO ${DataBaseConstants.PRODUCT_TABLE}(${DataBaseConstants.PRODUCT_TABLE_NAME},${DataBaseConstants.PRODUCT_TABLE_IMAGE},${DataBaseConstants.PRODUCT_TABLE_PRICE},${DataBaseConstants.PRODUCT_TABLE_CATEGORY}) VALUES("لحم حاشى" ,"images/meat.png",150 ,1)',
    // Category zpaeh with Its Products
    'INSERT INTO ${DataBaseConstants.CATEGORY_TABLE}(${DataBaseConstants.CATEGORY_TABLE_NAME},${DataBaseConstants.CATEGORY_TABLE_IMAGE}) VALUES("قسم الذبائح" ,"cheap1.png")',
    'INSERT INTO ${DataBaseConstants.PRODUCT_TABLE}(${DataBaseConstants.PRODUCT_TABLE_NAME},${DataBaseConstants.PRODUCT_TABLE_IMAGE},${DataBaseConstants.PRODUCT_TABLE_PRICE},${DataBaseConstants.PRODUCT_TABLE_CATEGORY}) VALUES("تيس بلدى" ,"images/11.png",150 ,2)',
    'INSERT INTO ${DataBaseConstants.PRODUCT_TABLE}(${DataBaseConstants.PRODUCT_TABLE_NAME},${DataBaseConstants.PRODUCT_TABLE_IMAGE},${DataBaseConstants.PRODUCT_TABLE_PRICE},${DataBaseConstants.PRODUCT_TABLE_CATEGORY}) VALUES("نعيمي" ,"images/12.png",150 ,2)',
    'INSERT INTO ${DataBaseConstants.PRODUCT_TABLE}(${DataBaseConstants.PRODUCT_TABLE_NAME},${DataBaseConstants.PRODUCT_TABLE_IMAGE},${DataBaseConstants.PRODUCT_TABLE_PRICE},${DataBaseConstants.PRODUCT_TABLE_CATEGORY}) VALUES("حري" ,"images/13.png",150 ,2)',
    'INSERT INTO ${DataBaseConstants.PRODUCT_TABLE}(${DataBaseConstants.PRODUCT_TABLE_NAME},${DataBaseConstants.PRODUCT_TABLE_IMAGE},${DataBaseConstants.PRODUCT_TABLE_PRICE},${DataBaseConstants.PRODUCT_TABLE_CATEGORY}) VALUES("نجدى" ,"images/14.png",150 ,2)',
  ];
// initialize the database
  String dbpath = "gooood.sqlite";
  await db
      .init(
          path: dbpath,
          schema: [
            category,
            product,
            wishList,
            shoppingCart,
            shoppingCartSpecification
          ],
          queries: populateQueries,
          verbose: true)
      .catchError((dynamic e) {
    throw ("Error initializing the database: ${e.message}");
  });
}
