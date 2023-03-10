import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SizedBox(height: 50 , width: 100,child: Image.asset('assets/images/star_wars_logo.png', fit: BoxFit.contain)),
                const Icon(Icons.filter_list_rounded, size: 28,)
              ],),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: Colors.red),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(topLeft:Radius.circular(16), bottomLeft: Radius.circular(16))),
                            height: 200,
                            width: 140,
                          ),
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('A', style: TextStyle(fontSize: 24),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('More info'),
                                    Icon(Icons.chevron_right_outlined, size: 30,)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                ),
            )
          ],
        ),
      ),
    );
  }
}