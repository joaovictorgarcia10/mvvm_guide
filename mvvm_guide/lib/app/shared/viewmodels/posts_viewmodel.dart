import 'package:flutter/cupertino.dart';
import 'package:semana_arch/app/shared/models/posts_model.dart';
import 'package:semana_arch/app/shared/repository/posts_repository_interface.dart';

class PostsViewModel {
  final IPostsRepository repository;

  final postsList = ValueNotifier<List<PostsModel>>([]);

  PostsViewModel({
    required this.repository,
  });

  Future fillPostsList() async {
    postsList.value = await repository.getPosts();
  }
}
