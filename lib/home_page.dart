import 'package:api/models/currency_model.dart';
import 'package:api/service/get_user_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work with difficult API"),
      ),
      body: FutureBuilder(
        future: CurrencyService.getData(),
        builder: (context, AsyncSnapshot<List<Welcome>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data![index].title!),
                    subtitle: Text(snapshot.data![index].cbPrice!),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }
}
