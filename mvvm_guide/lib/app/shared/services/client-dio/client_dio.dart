import 'package:dio/dio.dart';
import 'client_dio_interface.dart';

class ClientDio implements IClientDio {
  final Dio dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    var response = await dio.get(url);
    return response.data;
  }
}
