import 'package:flutter/material.dart';
import 'package:semana_arch/app/shared/models/posts_model.dart';
import 'package:semana_arch/app/shared/repository/posts_repository.dart';
import 'package:semana_arch/app/shared/services/client-dio/client_dio.dart';
import 'package:semana_arch/app/shared/viewmodels/posts_viewmodel.dart';

import 'components/custom_switch_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  final controller = HomeController(
    postsViewModel: PostsViewModel(
      repository: PostRespository(
        clientDio: ClientDio(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.wb_sunny_outlined),
                    title: Text('Dark Theme'),
                    trailing: CustomSwitchWidget(),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Meus Posts',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ValueListenableBuilder<List<PostsModel>>(
                  valueListenable: controller.posts,
                  builder: (context, model, child) {
                    // Lista Vazia
                    if (model.length == null)
                      Center(child: CircularProgressIndicator());

                    // Lista Ok
                    return ListView.builder(
                      itemCount: model.length,
                      itemBuilder: (context, index) {
                        var post = model[index];
                        return ListTile(
                          leading: Text(post.id.toString()),
                          title: Text(post.title!),
                          trailing: IconButton(
                            icon: Icon(Icons.navigate_next_outlined),
                            onPressed: () {},
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getPosts();
        },
        child: Icon(Icons.download_outlined),
      ),
    );
  }
}
