import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  static final String id = "upload_page";
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Upload Page"),
    );
  }
}