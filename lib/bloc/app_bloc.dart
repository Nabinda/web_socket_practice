import 'dart:async';

import 'package:binance_flutter/model/response_model.dart';
import 'package:binance_flutter/repo/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appBloc = Provider((ref) => AppBloc(ref: ref));

class AppBloc extends ChangeNotifier {
  final Ref ref;
  final StreamController<ResponseModel> _controller =
      StreamController<ResponseModel>();

  AppBloc({required this.ref}) {
    Stream<ResponseModel> streamData = ref.watch(appRepo).modelStream();
    streamData.listen((event) {
      _controller.sink.add(event);
    });
  }

  Stream<ResponseModel> get modelStream => _controller.stream;

  void dispose() {
    _controller.close();
    super.dispose();
  }
}
