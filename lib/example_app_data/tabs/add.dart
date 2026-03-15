import 'package:flutter/material.dart';
import 'package:practicee/example_app_data/screens/profile.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final formKey = GlobalKey<FormState>();
  String _uname = '';
  String _unumber = '';
  String _uemail = '';
  String _upassword = '';
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(
              height: 25.0,
            ),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                fillColor: Colors.blue.shade100.withOpacity(0.5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      BorderSide(color: Colors.pinkAccent.shade700, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _name.text = '';
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                ),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              keyboardType: TextInputType.name,
              maxLength: 20,
              onSaved: (value) {
                setState(() {
                  _uname = value!;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Name';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _phone,
              decoration: InputDecoration(
                fillColor: Colors.blue.shade100.withOpacity(0.5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      BorderSide(color: Colors.pinkAccent.shade700, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      _phone.text = '';
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black,
                    )),
                hintText: 'Enter your number',
                labelText: 'Number',
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                //   borderSide: BorderSide(color: Colors.amber, width: 1.0),
                // ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              onSaved: (value) {
                setState(() {
                  _unumber = value!;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Number';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                fillColor: Colors.blue.shade100.withOpacity(0.5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      BorderSide(color: Colors.pinkAccent.shade700, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      _email.text = '';
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black,
                    )),
                hintText: 'Enter your email',
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.pinkAccent, width: 1.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 30,
              onSaved: (value) {
                setState(() {
                  _uemail = value!;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Email';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                fillColor: Colors.blue.shade100.withOpacity(0.5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      BorderSide(color: Colors.pinkAccent.shade700, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(
                  Icons.security,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure
                      ? Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        ),
                ),
                hintText: 'Enter your password',
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.pinkAccent, width: 1.0),
                ),
              ),
              obscureText: isObscure,
              keyboardType: TextInputType.visiblePassword,
              maxLength: 20,
              onSaved: (value) {
                setState(() {
                  _upassword = value!;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Password';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            InkWell(
              splashColor: Colors.deepPurpleAccent,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              onTap: () async {
                final isValid = formKey.currentState!.validate();
                if (isValid) {
                  formKey.currentState!.save();
                  final message =
                      'Username: $_uname\nPhone: $_unumber\nEmail :$_uemail\nPassword :$_upassword';
                  final snackBar = SnackBar(
                    duration: Duration(seconds: 4),
                    content: Text(
                      message,
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  await Future.delayed(Duration(seconds: 5));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                }
              },
              child: Ink(
                height: 60.0,
                width: 300.0,
                child: Row(
                  children: const [
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink,
                      Colors.purple,
                      Colors.lightBlueAccent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
