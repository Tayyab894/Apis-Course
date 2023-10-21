import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_two/namazTiming/api_Services/namazi_api_services.dart';

import '../models/namaztimingmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Datum>>? _future;
  Future<List<Datum>>? _futureDate;

  @override
  void initState() {
    super.initState();

    setState(() {
      _future = NamazApiServices.loadPrayerTiming();
      _futureDate = NamazApiServices.loadprayerTimingDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
            child: Text("APIs", style: TextStyle(color: Colors.white))),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (context, AsyncSnapshot<List<Datum>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("LAODING");
                } else {
                  print("objectobjectobject new ${snapshot.data!.length}");
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var snap = snapshot.data![index].timings;
                        var dateSnap = snapshot.data![index].date;
                        print(dateSnap?.hijri.toString());

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "DATE : ${dateSnap?.hijri?.date} hijri",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Fajr : ${snap?.fajr}",
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.lightGreenAccent),
                                  ),
                                  Text(
                                    "asr  : ${snap?.asr}",
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.grey),
                                  ),
                                  Text(
                                    "duhr : ${snap?.dhuhr}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.cyan),
                                  ),
                                  Text(
                                    "isha : ${snap?.isha}",
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.deepPurple),
                                  ),
                                  Text(
                                    "maghrib: ${snap?.maghrib}",
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.lime),
                                  ),
                                ]),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}





//  return ListTile(
//                           title: Text(
//                             "Fajr Timing: ${snap?.fajr}",
//                             style: const TextStyle(
//                                 fontSize: 20, color: Colors.black),
//                           ),
//                           subtitle: Text(
//                               "Dhuhr Timing: ${snapshot.data![index].timings?.dhuhr}"),
//                         );