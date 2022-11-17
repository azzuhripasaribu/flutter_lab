import 'package:flutter/material.dart';
import 'package:flutter_lab/main.dart';
class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = "";
  bool undergraduateDegree = false;
  bool diplomaDegree = false;
  bool masterDegree = false;
  bool doctorDegree = false;
  double age = 0;
  String pbdClass = "";
  List<String> listPBDClass = ['A', 'B', 'C', 'D', 'E', 'F', 'KI'];
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Adding clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Form'),
              onTap: () {
                // Routing the menu to the form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: Pak Dengklek",
                      labelText:  "Full Name",
                      // Add Icon to make it more intuitive
                      icon: const Icon(Icons.people),
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                    // Added behaviour when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        _fullName = value!;
                      });
                    },
                    // Added behaviour when name is saved
                    onSaved: (String? value){
                      setState(() {
                        _fullName = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value){
                      if (value == null || value.isEmpty) {
                        return 'Full name can not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        leading: Icon(Icons.school),
                        title: Text("Degree"),
                      ),
                      CheckboxListTile(
                        title: const Text('Undergraduate'),
                        value: undergraduateDegree,
                        onChanged: (bool? value) {
                          setState(() {
                            undergraduateDegree = value!;
                            if(value){
                              masterDegree = diplomaDegree = doctorDegree = false;
                            }
                          });
                        }
                      ),
                      CheckboxListTile(
                        title: const Text('Diploma'),
                        value: diplomaDegree,
                        onChanged: (bool? value) {
                          setState(() {
                            diplomaDegree = value!;
                            if(value){
                              undergraduateDegree = masterDegree = doctorDegree = false;
                            }
                          });
                        }
                      ),
                      CheckboxListTile(
                        title: const Text('Master'),
                        value: masterDegree,
                        onChanged: (bool? value) {
                          setState(() {
                            masterDegree = value!;
                            if(value){
                              undergraduateDegree = diplomaDegree = doctorDegree = false;
                            }
                          });
                        }
                      ),
                      CheckboxListTile(
                        title: const Text('Doctor'),
                        value: doctorDegree,
                        onChanged: (bool? value) {
                          setState(() {
                            doctorDegree = value!;
                            if(value){
                              undergraduateDegree = diplomaDegree = masterDegree = false;
                            }
                          });
                        }
                      ),
                      ListTile(
                        leading: const Icon(Icons.co_present),
                        title: Row(
                          children: [
                            Text('Age: ${age.round}')
                          ],
                        ),
                        subtitle: Slider(
                          value: age,
                          max: 100,
                          divisions: 100,
                          label: age.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              age = value;
                            });
                          },
                        ),
                      ),
                      // ListTile(
                      //   leading: const Icon(Icons.class_),
                      //   title: const Text('PBD Class'),
                      //   trailing: DropdownButton(
                      //     value: pbdClass,
                      //     icon: const Icon(Icons.keyboard_arrow_down),
                      //     items: listPBDClass.map((String items) {
                      //       return DropdownMenuItem(
                      //         value: items,
                      //         child: Text(items),
                      //       );
                      //     }).toList(),
                      //     onChanged: (String? newValue) {
                      //       setState(() {
                      //         pbdClass = newValue!;
                      //       });
                      //     },
                      //   ),
                      // ), 
                      SwitchListTile(
                        title: const Text('Practice Mode'),
                        value: _switchValue,
                        onChanged: (bool value) {
                          setState(() {
                          _switchValue = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 15,
                                      child: Container(
                                        child: ListView(
                                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            Center(child: const Text('Informasi Data')),
                                            SizedBox(height: 20),
                                            Container(
                                              margin: const EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    title: Text('Name: $_fullName'),
                                                  ),
                                                ],
                                              )
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Kembali'),
                                            ), 
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}