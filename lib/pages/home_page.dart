import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:codigo6_states/providers/person_provider.dart';
import 'package:codigo6_states/providers/post_provider.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    ExampleProvider exampleProvider =
        Provider.of<ExampleProvider>(context, listen: false);

    PersonProvider personProvider =
        Provider.of<PersonProvider>(context, listen: false);

    PostProvider postProvider =
        Provider.of<PostProvider>(context, listen: true);

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
      // body: ListView.builder(
      //   itemCount: personProvider.people.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(personProvider.people[index]),
      //       subtitle: Text("Descripción del item"),
      //     );
      //   },
      // ),
      // body: Consumer<PersonProvider>(
      //   builder: (context, provider, _) {
      //     return ListView.builder(
      //       itemCount: provider.people.length,
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           title: Text(provider.people[index]),
      //           subtitle: Text("Descripción del item"),
      //         );
      //       },
      //     );
      //   },
      // ),
      body: FutureBuilder(
        future: postProvider.getPosts(),
        builder: (context, snap) {
          if (snap.hasData) {
            return Text(snap.data.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
