import 'package:cleran_architecture_demo/bloc_observer.dart';
import 'package:cleran_architecture_demo/futures/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleran_architecture_demo/injection_container.dart' as di;
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  await GetStorage.init();
  runApp(const MyApp());
}
