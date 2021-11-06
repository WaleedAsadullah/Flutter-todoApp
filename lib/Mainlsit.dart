import 'package:flutter/material.dart';
// import 'package:todooapp/Listviews.dart';
// import 'package:todooapp/Button.dart';

class Mainlsit extends StatefulWidget {
  const Mainlsit({Key? key}) : super(key: key);

  @override
  _MainlsitState createState() => _MainlsitState();
}

var gettextedit = "";
var gettext = "";
var lst = [];
var nums;

class _MainlsitState extends State<Mainlsit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Add Item'),
                    content: TextField(
                      onChanged: (value) {
                        gettext = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            lst.add(gettext);
                            print(lst);
                          });

                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
            child: Text("+Add")),
        Expanded(
          child: ListView.builder(
              itemCount: lst.length,
              itemBuilder: (context, index) {
                nums = index + 1;
                return Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04,
                      left: MediaQuery.of(context).size.width * 0.04),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  // color: Colors.blueAccent,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                      minLeadingWidth: 1,
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$nums",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      title: Text(lst[index]),
                      // subtitle: Text("888"),
                      trailing: Container(
                        padding: EdgeInsets.only(right: 0),
                        child: Wrap(spacing: 0, children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,

                                  // minimumSize: Size(5, 3),
                                  alignment: Alignment.centerRight),
                              onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Column(
                                        children: [
                                          Text('Edit value'),
                                          TextField(
                                            controller: TextEditingController(
                                                text: lst[index]),
                                            // lst[index]
                                            onChanged: (value) {
                                              gettextedit = value;
                                            },
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              lst[index] = gettextedit;
                                            });

                                            Navigator.pop(context, 'OK');
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ),
                              child: Icon(Icons.edit_rounded)),
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(left: 8),
                                  // minimumSize: Size(50, 30),
                                  alignment: Alignment.centerLeft),
                              onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Column(
                                        children: [
                                          Text('Are You Sure to delete '),
                                          Text(
                                            lst[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.blueAccent),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.removeAt(index);
                                            });

                                            Navigator.pop(context, 'OK');
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ),
                              child: Icon(Icons.delete_rounded)),
                        ]),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
