import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/dummyAPI/EmployeeBean.dart';

class EmployeeList extends StatelessWidget {
  final List<EmployeeBean> empBean;

  const EmployeeList({Key key, this.empBean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (context, position) {
        return Column(
          children: [
            Divider(height: 5.0),
            ListTile(
              title: Text(
                '${empBean[position].name}',
                style:
                    TextStyle(fontSize: 22.0, color: Colors.deepOrangeAccent),
              ),
              subtitle: Text('${empBean[position].name}',
                  style:
                      TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic)),
              leading: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 35.0,
                    child: Text(
                      'EMP ${empBean[position].id}',
                      style:
                          TextStyle(fontSize: 22.0, color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
              onTap: () => onTapItem(context, empBean[position]),
            )
          ],
        );
      }),
    );
  }

  onTapItem(BuildContext context, EmployeeBean empBean) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(empBean.id.toString() + " - " + empBean.name),
    ));
  }
}
