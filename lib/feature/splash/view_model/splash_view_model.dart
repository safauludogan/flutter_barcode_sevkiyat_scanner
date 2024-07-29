import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/splash/view_model/state/splash_state.dart';

final class SplashViewModel extends Cubit<SplashState> {
  SplashViewModel() : super(SplashState(isLoading: false));
}
