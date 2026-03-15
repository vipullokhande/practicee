import 'package:flutter/material.dart';

class DownloadExampleScreen extends StatefulWidget {
  const DownloadExampleScreen({super.key});

  @override
  State<DownloadExampleScreen> createState() => _DownloadExampleScreenState();
}

class _DownloadExampleScreenState extends State<DownloadExampleScreen> {
  // Future openFile({
  //   required String url,
  //   required String fileName,
  // }) async {
  //   final file = await donwloadFile(url, fileName);
  //   print(file);
  //   OpenFile.open(file!.path);
  // }

  // Future<File?> donwloadFile(String url, String fileName) async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   final file = File('${appStorage.path}/$fileName');
  //   final res = await Dio().get(
  //     url,
  //     options: Options(
  //       responseType: ResponseType.bytes,
  //       followRedirects: false,
  //       receiveTimeout: const Duration(seconds: 0),
  //     ),
  //   );
  //   final ref = file.openSync(mode: FileMode.write);
  //   ref.writeFromSync(res.data);
  //   await ref.close();
  //   return file;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  // final files = await FilePicker.platform.pickFiles();
                  // OpenFile.open(files!.files.first.path!);
                },
                child: const Text('Download'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
