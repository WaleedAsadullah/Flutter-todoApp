import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({ Key? key }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}
  var gettext = "";
  var lst = [];


class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Add Item'),
                          content:  TextField(onChanged: (value) {
                            gettext = value;
                          },),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cance'),
                            ),
                            TextButton(
                              onPressed: () { 
                                    setState(() {
                                      lst.add(gettext);
                                      print(lst);
                                    });
                                  
                                Navigator.pop(context, 'OK');},
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                  child: Text("+Add"));
  }
}