import 'package:semana_arch/app/shared/models/posts_model.dart';
import 'package:semana_arch/app/shared/repository/posts_repository_interface.dart';
import 'package:semana_arch/app/shared/services/client-dio/client_dio_interface.dart';

class PostRespository implements IPostsRepository {
  final IClientDio clientDio;

  PostRespository({
    required this.clientDio,
  });

  @override
  Future<List<PostsModel>> getPosts() async {
    var json =
        await clientDio.get('https://jsonplaceholder.typicode.com/posts');

    return json.map<PostsModel>((map) => PostsModel.fromMap(map)).toList();
  }
}
