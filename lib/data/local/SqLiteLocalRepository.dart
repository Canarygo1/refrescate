import 'package:refrescate/data/DbConfig.dart';
import 'package:refrescate/data/local/LocalRepository.dart';
import 'package:refrescate/model/cart.dart';
import 'package:sqflite/sqflite.dart';

class SqLiteLocalRepository implements LocalRepository {

  @override
  Future<int> insertCart(Cart cart) async {
    final db = await DBProvider.db.database;
    print(cart.id);
    var res = await db.rawInsert(
        "INSERT Into Cart (id,Estado,UsuarioCarritoId)"
        " VALUES ('212asdadad','TEST' , '1231231')");
    return res;
  }
}
