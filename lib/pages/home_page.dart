import 'package:codigo6_states/bloc/posts/post_bloc.dart';
import 'package:codigo6_states/bloc/posts/post_event.dart';
import 'package:codigo6_states/bloc/posts/post_state.dart';
import 'package:codigo6_states/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Listado de items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => RegisterPage(),
          //   ),
          // );
          BlocProvider.of<PostBloc>(context).add(GetPostEvent());
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripción del item"),
          ),
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripción del item"),
          ),
          BlocBuilder<PostBloc, PostState>(
            builder: (BuildContext context, PostState state) {
              if (state is PostInitState || state is PostLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PostSucceedState) {
                List posts = state.data;
                return Text(posts.toString());
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
