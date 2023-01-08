import 'package:classroom/page/Scholarship_page.dart';
import 'package:classroom/page/add_class_page.dart';
import 'package:classroom/page/class.dart';
import 'package:classroom/page/placements_page.dart';
import 'package:classroom/page/result_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../widget/reusable.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),

        // physics: Physi,
        child: GridView.builder(

            // scrollDirection: ,
            padding: EdgeInsets.all(15),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 13,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(onTap: (() {
                Navigator.pushNamed(context, ClassPage.routeName);
              }),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Class X',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'No of Students : 60',
                        style: TextStyle(fontSize: 14,color: Colors.white,),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: bottomNavBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddClassPage(),));
        },
        child: Icon(Icons.add),
      ),
      // floatingActionButton: FloatingActionButton(,onPressed: (){}, child: text),
    );
  }

  
}
