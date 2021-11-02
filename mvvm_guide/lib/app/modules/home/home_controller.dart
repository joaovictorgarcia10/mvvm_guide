import 'package:flutter/cupertino.dart';
import 'package:semana_arch/app/shared/models/posts_model.dart';
import 'package:semana_arch/app/shared/viewmodels/posts_viewmodel.dart';

class HomeController {
  final PostsViewModel postsViewModel;

  HomeController({
    required this.postsViewModel,
  });

  ValueNotifier<List<PostsModel>> get posts => postsViewModel.postsList;

  getPosts() {
    postsViewModel.fillPostsList();
  }
}
