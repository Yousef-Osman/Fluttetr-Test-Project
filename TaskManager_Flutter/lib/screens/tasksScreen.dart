import 'package:flutter/material.dart';
import 'package:task_manager/services/HttpService.dart';

class TasksScreen extends StatelessWidget {
  final HttpService httpService = HttpService();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: FutureBuilder(
          future: httpService.getTasks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      elevation: 1.5,
                      child: ListTile(
                        isThreeLine: true,
                        title: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data[index].date.toString(),
                                  style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  snapshot.data[index].body,
                                  style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w500),
                                ),
                              ]),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 10),
                          child: Text(
                            snapshot.data[index].isDone.toString(),
                            style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w400),
                          ),
                        ),
                        onTap: () {},
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}