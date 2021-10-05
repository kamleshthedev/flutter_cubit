import 'package:cubit_example/cubit/posts_cubit.dart';
import 'package:cubit_example/models/post_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(
        builder: (context, post) {
          if (post.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: post.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    leading: CircleAvatar(
                      child: Text(post[index].id.toString()),
                    ),
                    title: Text(
                      post[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
