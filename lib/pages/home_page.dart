import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/providers/example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExampleProvider exampleProvider =
        Provider.of<ExampleProvider>(context, listen: false);

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
          Consumer<ExampleProvider>(
            builder: (context, provider, _) {
              return Text(
                provider.contador.toString(),
                style: TextStyle(
                  fontSize: 30.0,
                ),
              );
            },
          ),
          // Text(
          //   context.watch<ExampleProvider>().contador.toString(),
          // ),
        ],
      ),
    );
  }
}
