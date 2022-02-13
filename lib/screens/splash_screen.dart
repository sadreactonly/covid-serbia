import 'package:flutter/material.dart';

class SplashApp extends StatefulWidget {
  final Function onInitializationComplete;

  const SplashApp({
    Key? key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {

  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  Future<void> _initializeAsyncDependencies() async {

    Future.delayed(
      const Duration(milliseconds: 1000),
          () => widget.onInitializationComplete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kovid',
      home: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const Scaffold(
        body: CircularProgressIndicator()
    );
  }
}
