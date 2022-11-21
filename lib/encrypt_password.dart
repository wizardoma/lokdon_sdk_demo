import 'package:flutter/material.dart';
import 'package:lokdon_sdk/lokdon_sdk.dart';

class EncryptPassword extends StatefulWidget {
  const EncryptPassword({Key? key}) : super(key: key);

  @override
  State<EncryptPassword> createState() => _EncryptPasswordState();
}

class _EncryptPasswordState extends State<EncryptPassword> {
  String textResult = "", cipherResult = "";
  int salt = 1, decryptSalt = 1;
  String text = "", cipher = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Encrypt / Decrypt Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: constraints.maxWidth * 0.46,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (s) {
                              setState(() {
                                text = s;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "Password", border: OutlineInputBorder()),
                          ),
                        ),
                        Expanded(
                          child: TextField(

                            onChanged: (s) {
                              setState(() {
                                salt = int.parse(s);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Salt", border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SelectableText(textResult),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (text.isNotEmpty) {
                            setState(() {
                              textResult = "";
                            });

                            var string = encryptPassword(text,salt: salt);
                            setState(() {
                              textResult = string;
                            });
                          }
                        },
                        child: Text("Encrypt Password"))
                  ],
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.46,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (s) {
                              setState(() {
                                cipher = s;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "Cipher", border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelectableText(cipherResult),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (cipher.isNotEmpty) {
                            setState(() {
                              cipherResult = "";
                            });

                            var string = decryptPassword(cipher,);
                            setState(() {
                              cipherResult = string;
                            });
                          }
                        },
                        child: const Text("Decrypt Password"))
                  ],
                ),
              ),

            ],
          );
        }),
      ],
    );
  }
}
