import 'package:camel/statics/DataBaseConstants.dart';
import 'config.dart';

class SqlLiteDataBase {
  static Future<void> addToShoppingCart(int productId, int qty , {Map<String , String > specification}) async {
    var testResponse = await db.select(
        table: DataBaseConstants.SHOPPING_CART_TABLE,
        where:
            "${DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_ID} = $productId");
    if (testResponse.length != 0) {
      int newQty = testResponse[0]
              [DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_QTY] +
          qty;
      Map<String, String> row = {
        DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_QTY: "$newQty",
      };
      await db.update(
          table: DataBaseConstants.SHOPPING_CART_TABLE,
          row: row,
          where:
              "${DataBaseConstants.SHOPPING_CART_TABLE_ID} = ${testResponse[0][DataBaseConstants.SHOPPING_CART_TABLE_ID]}");
    }else {
      Map<String, String> row = {
        DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_ID: "$productId",
        DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_QTY: "$qty",
      };
     final insertedId =  await db
          .insert(
          table: DataBaseConstants.SHOPPING_CART_TABLE,
          row: row,
          verbose: true)
          .catchError((dynamic e) {
        throw (e);
      });
     await addShoppingCartProductSpecification(insertedId, specification);
    }

    testResponse =
        await db.select(table: DataBaseConstants.SHOPPING_CART_TABLE);
    print("test response Of adding : : $testResponse");
  }

  static Future<void> addShoppingCartProductSpecification(int soppingCartId , Map<String,String > specification)async{

     specification.forEach( (key ,value) async{
     await db.insert(table: DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE, row: {
        DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_SHOPPING_ID:"$soppingCartId" ,
        DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_KEY : key ,
        DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_VALUE : value,

      });
      final testResponse = await db.select(table: DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE);
      print("test Response Of Specification : : : $testResponse");
    });

  }

  static Future<int> getShoppingCartCount()async{
    int count =await db.count(table: DataBaseConstants.SHOPPING_CART_TABLE) ;
    return count ;
  }

}
