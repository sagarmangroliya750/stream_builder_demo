// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
        home: clock(),
  ));
}

class clock extends StatefulWidget {
  const clock({Key? key}) : super(key: key);

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {

  bool ref = false;

  Stream<String> getTime() async* {
    while (true) {
      await Future.delayed(Duration(seconds:1));
      DateTime d = DateTime.now();
      String Time = "${d.hour} Hr : ${d.minute} Min : ${d.second} Sec";

      yield Time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Stream Builder",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:100,left:85),
            child: StreamBuilder(
              stream: getTime(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                {
                  return Padding(
                    padding: const EdgeInsets.only(top:70),
                  );
                }
                else
                {
                  if (snapshot.hasData)
                  {
                    Object Time = snapshot.data ?? "";
                    return CircleAvatar(
                      backgroundColor: Colors.black87,
                      maxRadius: 90,
                      child:Text("$Time", style: TextStyle(fontSize: 15))
                    );
                  }
                  else
                  {
                    return Center(
                      child: Text("No Data Found"),
                    );
                  }
                }
              },
            ),
          ),
        ]
      )
    );
  }
}
