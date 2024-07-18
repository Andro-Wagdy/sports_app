import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'circular_indicator_state.dart';

class CircularIndicatorCubit extends Cubit<CircularIndicatorState> {
  CircularIndicatorCubit() : super(CircularIndicatorInitial());

  var isLoading = false;

  void Circular() async {
    isLoading = true;
    emit(CircularIndicatorInitial());
    await Future.delayed(Duration(seconds: 3), () {
      isLoading = false;
      emit(CircularIndicator());
    });
  }
}
