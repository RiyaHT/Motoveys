import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'dart:convert';
import 'dart:async';

import 'package:motoveys/Screens/claimsDashboard.dart';
import 'package:motoveys/customProvider.dart';
import 'package:motoveys/dio.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  String phoneNumber = '';
  String mPin = '';
  final _formKey = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  bool isFocus = false;
  bool passwordVisible = true;
  bool isValidating = false;
  int buttonCounter = 5;
  Dio dio = DioSingleton.dio;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // validateMpin() {
  //   _prefs.then((SharedPreferences prefs) async {
  //     setState(() {
  //       isValidating = true;
  //     });
  //     phoneNumber = prefs.getString('phoneNumber') ?? '';
  //     Map<String, dynamic> data = {'mobileNo': phoneNumber, 'mpin': mPin};
  //     String key = generateRandomKey();
  //     String base64iv = generateRandomIV();
  //     String result = aesGcmEncryptJson(jsonEncode(data), key, base64iv);
  //     String apiLink = dotenv.env['API_LINK']!;
  //     final appState = Provider.of<AppState>(context, listen: false);
  //     Map<String, dynamic> postData = {
  //       "encryptedData": result,
  //       "key": key,
  //       "base64IV": base64iv,
  //     };
  //     Map<String, String> headers = {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Charset': 'utf-8',
  //       "Accept": "application/json",
  //       "Authorization": 'Bearer ${appState.accessToken}'
  //     };
  //     try {
  //       final response = await dio.post('${apiLink}Cafe/validateMPIN',
  //           data: postData, options: Options(headers: headers));
  //       if (response.statusCode == 200) {
  //         if (response.data == 'MPIN is valid') {
  //           setState(() {
  //             isValidating = false;
  //           });
  //           // ignore: use_build_context_synchronously
  //           Navigator.pushReplacementNamed(context, '/home');
  //         }
  //       }
  //     } on DioException catch (e) {
  //       setState(() {
  //         isValidating = false;
  //       });
  //       if (e.response.toString() == 'Invalid MPIN') {
  //         setState(() {
  //           if (buttonCounter > 0) {
  //             buttonCounter--;
  //           }
  //         });
  //         if (buttonCounter == 0) {
  //           int currentTimeStamp = DateTime.now().millisecondsSinceEpoch;
  //           prefs.setString(
  //               'storedTriesTimestamp', currentTimeStamp.toString());
  //           prefs.setBool('isLocked', true);
  //           Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => const LockedScreen(
  //                         timestamp: '10',
  //                       )),
  //               (_) => false);
  //         }
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             content: const Text("Invalid MPIN. Please try again!"),
  //             action: SnackBarAction(
  //               label: ' Cancel',
  //               onPressed: () {},
  //             )));
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             content: const Text("Technical Error!"),
  //             action: SnackBarAction(
  //               label: ' Cancel',
  //               onPressed: () {},
  //             )));
  //       }
  //     }
  //   });
  // }

  validLogin() async {
    setState(() {
      isValidating = true;
    });
    final appState = Provider.of<AppState>(context, listen: false);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Authorization": "Bearer ${appState.accessToken}"
    };
    Map<String, dynamic> postData = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      final response = await dio.post(
          'https://cafe.sbigeneral.in/Cafe/api/motoveys/login',
          data: postData,
          options: Options(headers: headers));

      setState(() {
        isValidating = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );

      print(response.data);
      // ignore: empty_catches
    } on DioException catch (error) {
      print(error.message);

      setState(() {
        isValidating = false;
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Invalid credentials!')),
      // );
    }
  }

  String? validateEmail(String? value) {
    if (value == null || !value.endsWith('@sbigeneral.in')) {
      return 'Email must end with @sbigeneral.in';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(children: [
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      // Colors.white,
                      // Colors.white,
                      Color.fromRGBO(63, 166, 235, 0.55),
                      Color.fromRGBO(112, 12, 121, 0.55),
                    ],
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: ClipPath(
                        clipper: WaveClipperTwo(reverse: false),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            'lib/assests/loginPage.png',
                            width: 250,
                          ),
                        ),
                      )),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      //   child: Center(
                      //     child: SizedBox(
                      //         width: 120,
                      //         height: 120,
                      //         child: Image.asset('lib/assests/sbilogo.png')),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 25,
                                      bottom: 0),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 112, 12, 121),
                                                  width: 2.0),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.mail_outline_outlined,
                                            ),
                                            prefixIconColor:
                                                MaterialStateColor.resolveWith(
                                                    (Set<MaterialState>
                                                        states) {
                                              if (states.contains(
                                                  MaterialState.focused)) {
                                                return const Color.fromARGB(
                                                    255, 112, 12, 121);
                                              }
                                              return Colors.grey;
                                            }),
                                            border: const OutlineInputBorder(),
                                            labelText: 'Enter Email ID',
                                            labelStyle: TextStyle(
                                                color: isFocus
                                                    ? const Color.fromARGB(
                                                        255, 112, 12, 121)
                                                    : Colors.grey),
                                            hintText:
                                                'Enter official Email ID'),
                                        validator: validateEmail,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        focusNode: focusNode,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: passwordVisible,
                                        // inputFormatters: <TextInputFormatter>[
                                        //   FilteringTextInputFormatter.digitsOnly
                                        // ],
                                        decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 112, 12, 121),
                                                  width: 2.0),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.lock,
                                            ),
                                            prefixIconColor:
                                                MaterialStateColor.resolveWith(
                                                    (Set<MaterialState>
                                                        states) {
                                              if (states.contains(
                                                  MaterialState.focused)) {
                                                return const Color.fromARGB(
                                                    255, 112, 12, 121);
                                              }
                                              return Colors.grey;
                                            }),
                                            suffixIcon: IconButton(
                                              icon: Icon(passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    passwordVisible =
                                                        !passwordVisible;
                                                  },
                                                );
                                              },
                                            ),
                                            suffixIconColor:
                                                const Color.fromARGB(
                                                    255, 112, 12, 121),
                                            alignLabelWithHint: false,
                                            filled: true,
                                            border: const OutlineInputBorder(),
                                            labelText: 'Enter Password',
                                            labelStyle: TextStyle(
                                                color: isFocus
                                                    ? const Color.fromARGB(
                                                        255, 112, 12, 121)
                                                    : Colors.grey),
                                            hintText: 'Enter Password'),
                                        // maxLength: 4,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Valid Password';
                                          }
                                          return null;
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        // focusNode: focusNode,
                                        onChanged: (val) =>
                                            {setState(() => mPin = val)},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 65,
                                width: 360,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0, top: 21),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 112, 12, 121),
                                    ),
                                    onPressed: () {
                                      // if (emailController.text ==
                                      //         '22775@sbigeneral.in' &&
                                      //     passwordController.text ==
                                      //         'test@123') {
                                      //   print('button clicked');

                                      //   validLogin();
                                      // }
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        // If the form is valid, you can proceed with further actions
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(
                                        //   SnackBar(
                                        //       content: Text('Email is valid!')),
                                        // );
                                        print('Validations done');
                                        validLogin();
                                      } else {
                                        // If the form is not valid, show a snackbar with the error
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text('Invalid credentials!')),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Log In',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //     padding:
                              //         const EdgeInsets.fromLTRB(15, 10, 15, 10),
                              //     child: Text(
                              //         'Only $buttonCounter attempts left!')),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.white),
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            '© SBI General Insurance Company Limited | All Rights Reserved.',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 9,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 45, 3, 49)),
                          ),
                        ),
                      ]),
                ),
              ),
            ])),
        isValidating
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      const Text('Please Wait...',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF700C79))),
                      const SizedBox(
                        height: 10,
                      ),
                      LoadingAnimationWidget.threeArchedCircle(
                        color: const Color.fromRGBO(112, 12, 121, 1),
                        size: 50,
                      ),
                    ])),
              )
            : Container()
      ],
    );
  }
}
