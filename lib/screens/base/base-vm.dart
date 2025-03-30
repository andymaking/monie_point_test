import 'package:flutter/material.dart';

import '../../utils/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.loading;

  ViewState get viewState => _viewState;

  final formKey = GlobalKey<FormState>();
  final GlobalKey repaintKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  set viewState(ViewState newState) {
    _viewState = newState;
    _viewState == ViewState.loading ? isLoading = true : isLoading = false;
    notifyListeners();
  }

  bool isLoading = false;

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.loading;
      notifyListeners();
    }
  }


  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.idle;
      notifyListeners();
    }
  }

}