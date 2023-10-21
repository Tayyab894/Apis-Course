import 'package:task_one/product/services/product_services.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  Future<List<ModelPost>>? postList;

  @override
  void initState() {
    super.initState();
    postList = ProductsServices.loadProducts();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Fake API'S",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder(
          future: postList,
          builder: (context, AsyncSnapshot<List<ModelPost>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              const Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      "Wait",
                      style: TextStyle(color: Colors.black, fontSize: 30,),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      "Some Error Occured!",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!;
                    return Card(
                      elevation: 4,
                      shadowColor: Colors.blueAccent,
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data[index].image.toString()),
                          ),
                          trailing: Text(
                            '${data[index].price.toString()}\$',
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          subtitle: Text(data[index].title.toString()),
                          title: Text(data[index].category.toString())),
                    );
                  });
            } else {
              return const Text("Something happend!");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
