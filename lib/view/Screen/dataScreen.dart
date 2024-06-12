// ignore_for_file: file_names

import 'package:albarka_final/model/Comments_model.dart';
import 'package:albarka_final/res/String_App.dart';
import 'package:albarka_final/res/colors_App.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Comments> result = [];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor),
                child: const Row(
                  children: [
                    Text(
                      'All projects',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Icon(Icons.circle, color: scaffoldColor),
                    Icon(Icons.circle, color: scaffoldColor),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              FutureBuilder(
                future: getComments(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    result = snapshot.data!;
                  }
                  if (snapshot.hasData) {
                    return StatefulBuilder(builder: (context, setstate) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              onChanged: (value) {
                                result = [];
                                for (var i = 0;
                                    i < snapshot.data!.length;
                                    i++) {
                                  if (snapshot.data![i].name!.contains(value)) {
                                    result.add(snapshot.data![i]);
                                  }
                                }
                                setstate(() {});
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: 'Search for name products',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height,
                            child: ListView.builder(
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                return myContainer(
                                    height, width, snapshot, index, result);
                              },
                            ),
                          ),
                        ],
                      );
                    });
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search for name products',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const CircularProgressIndicator(),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container myContainer(
      double height,
      double width,
      AsyncSnapshot<List<Comments>> snapshot,
      int index,
      List<Comments> result) {
    return Container(
      margin: EdgeInsets.only(bottom: height / 25, right: 15, left: 15),
      width: width,
      height: height / 8.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: containerColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Image.asset(
                  "images/2.png",
                ),
                Positioned(
                  left: 13,
                  child: Text(
                    '${snapshot.data![index].price}',
                    // '6/15/\n2024',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${result[index].name}',
                  style: const TextStyle(color: scaffoldColor, fontSize: 15),
                ),
                const SizedBox(height: 5),
                Text(
                  '${snapshot.data![index].description}',
                  style: const TextStyle(color: scaffoldColor, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<List<Comments>> getComments() async {
  Dio req = Dio();
  Response response = await req.get(mockapiUrl);
  print(response);
  print('response000000000');
  print(response.statusCode);

  List<Comments> myCommentsList = List.generate(
    response.data.length,
    (index) => Comments.fromMap(response.data[index]),
  );
  print('000000000000000000000000');
  print(myCommentsList);
  print('000000000000000000000000');
  return myCommentsList;
}
