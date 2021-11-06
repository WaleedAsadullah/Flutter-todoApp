import 'package:flutter/material.dart';
import 'package:todooapp/Mainlsit.dart';
class Listviews extends StatefulWidget {
  const Listviews({Key? key, required this.name, required this.numbers})
      : super(key: key);
  final String name;
  final int numbers;

  @override
  _ListviewsState createState() => _ListviewsState();
}
// var lst = [];
class _ListviewsState extends State<Listviews> {
  @override
  Widget build(BuildContext context) {
    // var name;
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.04),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.08,
      // color: Colors.blueAccent,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.001,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(),
          title: Text(widget.name),
          trailing: ElevatedButton(
              onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Column(
                        children: [
                          Text('Are You Sure to delete '),
                          Text(widget.name),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              lst.removeAt(widget.numbers);
                              print(widget.numbers);
                              print(lst);
                            });

                            Navigator.pop(context, 'OK');
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
              child: Icon(Icons.delete_rounded)),
        ),
      ),
    );
  }
}
