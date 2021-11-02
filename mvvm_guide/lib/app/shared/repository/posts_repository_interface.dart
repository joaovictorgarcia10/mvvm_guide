import 'package:semana_arch/app/shared/models/posts_model.dart';

abstract class IPostsRepository {
  Future<List<PostsModel>> getPosts();
}
