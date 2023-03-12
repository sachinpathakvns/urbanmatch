import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/Model.dart';
import '../Data/Service.dart';
import '../Data/modelcomit.dart';

class TaskTwo extends StatefulWidget {
  const TaskTwo({Key? key}) : super(key: key);

  @override
  State<TaskTwo> createState() => _MyhomeState();
}

class _MyhomeState extends State<TaskTwo> {

  List<Urbanmatchcommit>? commit;
  var isloaded = false;

  getCategory() async {
    commit = await ServiceProvider().getcommit();
    if (commit != null) {
      setState(() {
        isloaded = true;
        for(int i=0; i<=commit!.length - 1; i++){
          print('******************image ${commit![i].commit?.author?.name}');
        }
      });
    }
  }


  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Task 2'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding:
                    const EdgeInsets.only(top: 13, bottom: 10, right: 18, left: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade500,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    height: 500,
                    child: Visibility(
                      visible: isloaded,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return ListView.builder(
                          itemCount: commit?.length,
                          // controller: _doctorHospitalListScrollController,
                          padding: const EdgeInsets.only(right: 10),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 30, left: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade500,
                                  width: 1,
                                ),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${commit?[index].commit?.author?.email}",
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          "${commit?[index].commit?.author?.date}",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      width:
                                      MediaQuery.of(context).size.width *
                                          0.20,
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 5,
                                          right: 10),
                                      decoration: const BoxDecoration(
                                        // color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: SizedBox(
                                        height: 35,
                                        child: Text(
                                          "${commit?[index].commit?.author?.name}",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}