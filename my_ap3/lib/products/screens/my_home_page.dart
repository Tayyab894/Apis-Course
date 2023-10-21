import 'package:flutter/material.dart';
import 'package:my_ap3/products/model/model_post.dart';
import 'package:my_ap3/products/services/service_product.dart';
import 'package:my_ap3/utilities/app_assets.dart';
import 'package:my_ap3/utilities/rest_api_utilities.dart';

class Home extends StatelessWidget {
  Home() {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var client = http.Client();

  // bool isLoading = true;
  // bool isError = false;

  Future<List<ModelPost>>? _future_list;

  @override
  void initState() {
    super.initState();
    setState(() {
      _future_list = ServiceProduct.LoadProducts();
    });
  }

  // Future<List<ModelPost>> LoadData() async {
  //   // isLoading = true;
  //   //  String url = 'https://fakestoreapi.com/products';

  //   List<ModelPost> list = [];

  //   // Uri uri = Uri.parse('https://fakestoreapi.com/products');

  //   // Map<String, String> header = {"id": ""};
  //   // Map<String, dynamic> body = {"id": 1};

  //   var response = await client.get(uri);

  //   // isLoading = false;

  //   if (response.statusCode == 200) {
  //     //  setState(() {
  //     list = modelPostFromMap(response.body);
  //     return list;
  //     //   isError = false;
  //     //  });

  //     //   print("response Body get Successfully ${list.length}");
  //     //   print("response Body get Successfully ${list[0].title}");
  //   } else {
  //     // isError = true;
  //     return list;
  //     // if (response.statusCode == 404) {
  //     //   print("Response Sorry resource not found");
  //     // } else {
  //     //   print("Response Sorry ${response.statusCode}");
  //     // }
  //   }

  //   // print("response ${response.statusCode}");
  //   // print("response ${response.body}");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("APIs")),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        // child: RestApiUtilities.ShowLoadingView(context),

        child: FutureBuilder(
          future: _future_list,
          builder:
              (BuildContext context, AsyncSnapshot<List<ModelPost>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: RestApiUtilities.ShowLoadingView(context));
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Error : ${snapshot.error}',
                  style: TextStyle(fontSize: 25),
                ));
              } else if (snapshot.hasData) {
                List<ModelPost> list = snapshot.data!;

                if (list.length > 0) {
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            RestApiUtilities.ShowLoadingViewDialog(context);

                            // Navigator.pop(context);
                          },
                          title: Text("${list[index].title}"),
                          subtitle: Text("${list[index].description}"),
                        );
                      });
                } else {

                    //  return Center(
                    //   child: RestApiUtilities.ShowMessageView(
                    //       context, AppAssets.no_internet, "no Record"));
                  

                  return Center(
                      child: RestApiUtilities.ShowErrorWithReloadView(
                          context, AppAssets.no_internet, "no Record", (){
                             setState(() {
      _future_list = ServiceProduct.LoadProducts();
    });
                          }));
                }
              } else {
                return SizedBox();
              }
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
