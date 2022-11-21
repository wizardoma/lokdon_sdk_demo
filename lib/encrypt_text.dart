import 'package:flutter/material.dart';
import 'package:lokdon_sdk/lokdon_sdk.dart';

class EncryptText extends StatefulWidget {
  const EncryptText({Key? key}) : super(key: key);

  @override
  State<EncryptText> createState() => _EncryptTextState();
}

class _EncryptTextState extends State<EncryptText> {
  String textResult = "", cipherResult = "";
  String text = "", cipher = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Encrypt / Decrypt Text",style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        LayoutBuilder(
          builder: (context,constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: constraints.maxWidth * 0.46,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(

                        onChanged: (s){
                          setState(() {
                            text = s;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(

                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      SelectableText(textResult),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){
                        if (text.isNotEmpty){
                        setState(() {
                          textResult = "";
                        });

                        var string = encryptString(text);
                        setState(() {

                          textResult = string;
                        });
                        }
                      }, child: Text("Encrypt"))
                    ],
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.46,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(

                        onChanged: (s){
                          setState(() {
                            cipher = s;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(

                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      SelectableText(cipherResult),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){
                        if (cipher.isNotEmpty){
                          setState(() {
                            cipherResult = "";
                          });

                          var string = decryptString(cipher);
                          setState(() {
                            cipherResult = string;
                          });
                        }
                      }, child: Text("Decrypt"))
                    ],
                  ),
                ),


              ],
            );
          }
        ),

      ],
    );
  }
}
