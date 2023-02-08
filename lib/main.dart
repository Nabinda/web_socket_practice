import 'package:binance_flutter/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Binance());
  }
}

class Binance extends HookConsumerWidget {
  const Binance({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final channel = ref.watch(appBloc).modelStream;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Bitcoin Aggregate Trade Streams',
          ),
          SizedBox(
            height: 50,
            child: StreamBuilder(
              stream: channel,
              builder: (context, snapshot) => snapshot.hasData
                  ? Column(
                      children: [
                        Text("Traded Quantity : ${snapshot.data?.quantity}"),
                        Text("Current Trade Price : ${snapshot.data?.price}"),
                      ],
                    )
                  : const CircularProgressIndicator.adaptive(),
            ),
          )
         
        ],
      ),
    );
  }
}
