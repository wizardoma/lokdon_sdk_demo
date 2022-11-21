import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lokdon_sdk/lokdon_sdk.dart';

class EncryptFile extends StatefulWidget {
  const EncryptFile({Key? key}) : super(key: key);

  @override
  State<EncryptFile> createState() => _EncryptFileState();
}

class _EncryptFileState extends State<EncryptFile> {
  File? rawFile, encryptedFile;
  File? rawEncryptFile, decryptedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Encrypt / Decrypt Files",
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.46,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(color: Colors.black)),
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path!);
                            setState(() {
                              rawFile = file;
                            });
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: const Text(
                          "Pick File",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (rawFile != null) SelectableText(rawFile!.path),
                      if (encryptedFile != null)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Text("Enrypted File: "),
                                Expanded(child: Text(encryptedFile!.path))
                              ],
                            )
                          ],
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (rawFile != null) {
                              // print(rawFile!.parent.path);
                              setState(() {
                                encryptedFile = encryptFile(rawFile!, "alex",
                                    "/storage/emulated/0/Download/${rawFile!.path.split("/").last}");
                              });
                            }
                          },
                          child: const Text("Encrypt File"))
                    ],
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.46,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(color: Colors.black)),
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path!);
                            setState(() {
                              rawEncryptFile = file;
                            });
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: const Text(
                          "Pick Encrypted File",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (rawEncryptFile != null)
                        SelectableText(rawEncryptFile!.path),
                      if (decryptedFile != null)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Text("Decrypted File: "),
                                Expanded(child: Text(decryptedFile!.path))
                              ],
                            )
                          ],
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (rawEncryptFile != null) {
                              // print(rawFile!.parent.path);
                              setState(() {
                                decryptedFile = decryptFile(rawEncryptFile!,
                                    "alex", "/storage/emulated/0/Download/${rawEncryptFile!.path.split("/").last}");
                              });
                            }
                          },
                          child: const Text("Decrypt File"))
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
