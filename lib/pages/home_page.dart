import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:codigo6_states/providers/post_provider.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    PostProvider postProvider =
        Provider.of<PostProvider>(context, listen: false);
    postProvider.getPosts2();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ///
    // });
  }

  @override
  Widget build(BuildContext context) {
    // PostProvider postProvider2 =
    //     Provider.of<PostProvider>(context, listen: true);
    // postProvider.getPosts2();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Listado de items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<PostProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text(provider.posts.toString());
        },
      ),
      // body: Text(postProvider2.posts.toString()),
    );
  }
}
