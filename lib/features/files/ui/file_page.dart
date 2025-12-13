import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

// move file picker logic to a separate screen
class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  final Logger log = Logger('FilePicker');
  String? _filePath;
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path;
      });

      log.info('File selected: $_fileName');
      log.info('Path: $_filePath');

      if (result.files.single.bytes != null) {
        log.info('File size: ${result.files.single.bytes!.length} bytes');
      }
    } else {
      log.info("Cancelled user pick");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("something something file something"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _pickFile, child: Text("Press me!")),
            SizedBox(height: 20),
            if (_fileName != null)
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 40),
                    SizedBox(height: 8),
                    Text(
                      'File Uploaded!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Selected: $_fileName'),
                    if (_filePath != null)
                      Text('Path: $_filePath',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
