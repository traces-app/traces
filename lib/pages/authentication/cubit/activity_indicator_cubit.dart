import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityIndicatorCubit extends Cubit<bool> {
  ActivityIndicatorCubit() : super(false);

  // events
  void toggle() {
    emit(!state);
  }
}
