import '../../models/product.dart';
import 'db_operations.dart';

class ProductDbController extends DbOperations<Product> {
  @override
  Future<int> create(Product model) async {
    // TODO: implement create
    return await database.insert(Product.tableName,model.toMap());

  }

  @override
  Future<bool> delete(id) async{
    // TODO: implement delete
    int countDeletedRows = await database.delete(Product.tableName , where:'id =?' ,whereArgs: [id]);

    return countDeletedRows==1;

  }

  @override
  Future<List<Product>> read() async{

    List<Map<String ,dynamic>> rowsMap =await database.query(Product.tableName);
    return rowsMap.map((rowMap) => Product.fromMap(rowMap)).toList();
  }

  @override
  Future<Product?> show(int id) async {
    // TODO: implement show
    List<Map<String,dynamic>> rowsMap =await database.query(Product.tableName , where: 'id=?', whereArgs:[id] );

    if(rowsMap.isNotEmpty){

      return Product.fromMap(rowsMap.first);
    }
    return null;
  }

  @override
  Future<bool> update(Product model) async {
    // TODO: implement update

    int rowsUpdated=await database.update(Product.tableName, model.toMap(),where: 'id =? AND use_id' ,whereArgs: [model.id ,model.userId]);

    return rowsUpdated==1;


    throw UnimplementedError();
  }

}