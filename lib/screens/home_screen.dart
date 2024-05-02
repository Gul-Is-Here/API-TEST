import 'package:api_test/model/api_method.dart';
import 'package:api_test/model/model.dart';
import 'package:flutter/material.dart';

Networking networkingHelper = Networking();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Test Apis'),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: networkingHelper.getApiData(),
            builder: (context, AsyncSnapshot<List<Welcome>> snapshot) {
              if (snapshot.hasData)
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Welcome welcome = snapshot.data![index];
                      return ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            welcome.title,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(welcome.body),
                        ),
                      );
                    });
              else
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                );
            }),
      ),
    );
  }
}
