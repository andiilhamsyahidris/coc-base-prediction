import 'package:coc_base_prediction/app/constant.dart';
import 'package:coc_base_prediction/presentation/bases/resources/string_res.dart';
import 'package:coc_base_prediction/presentation/bases/states/state_renderer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

// Loading State (POPUP, FULL SCREEN)

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  int? progress;

  LoadingState(
      {required this.stateRendererType, String? message, this.progress})
      : message = message ?? CocStrings.loading.tr();

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// error state (POPUP, FULL LOADING)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  String? textButton;
  Function? onCloseDialogFunction;

  ErrorState(this.stateRendererType, this.message,
      {this.textButton, this.onCloseDialogFunction});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// CONTENT STATE

class ContentState extends FlowState {
  bool dismissDialog;
  ContentState({this.dismissDialog = false});

  @override
  String getMessage() => Constant.empty;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.contentScreenState;
}

// EMPTY STATE

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.emptyScreenState;
}

// success state
class SuccessState extends FlowState {
  String message;

  Function onSuccessFunction;

  StateRendererType? stateRendererType;

  SuccessState(this.message, this.onSuccessFunction, {this.stateRendererType});

  @override
  String getMessage() => message;
  @override
  StateRendererType getStateRendererType() =>
      stateRendererType ?? StateRendererType.popupSuccess;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
      BuildContext context, Widget contentScreenWidget, Function actionFunction,
      {Function? closeDialogFunction}) {
    switch (runtimeType) {
      case LoadingState _:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // showing popup dialog
            if ((this as LoadingState).progress != null) {
              dismissDialog(context);
            }
            showPopUp(context, getStateRendererType(), getMessage(),
                progress: (this as LoadingState).progress,
                closeDialogFunction: closeDialogFunction);
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_LOADING_STATE
          {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                actionFunction: actionFunction);
          }
        }
      case ErrorState _:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage(),
                closeDialogFunction:
                    (this as ErrorState).onCloseDialogFunction ??
                        closeDialogFunction);
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_ERROR_STATE
          {
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              actionFunction:
                  (this as ErrorState).onCloseDialogFunction ?? actionFunction,
              textButton: (this as ErrorState).textButton,
            );
          }
        }
      case ContentState _:
        {
          if ((this as ContentState).dismissDialog) {
            dismissDialog(context);
          }
          return contentScreenWidget;
        }
      case EmptyState _:
        {
          return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              actionFunction: actionFunction);
        }
      case SuccessState _:
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupSuccess) {
            // show popup
            showPopUp(context, StateRendererType.popupSuccess, getMessage(),
                title: CocStrings.success.tr(),
                closeDialogFunction: (this as SuccessState).onSuccessFunction);
            // return content ui of the screen
            return contentScreenWidget;
          } else {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                actionFunction: (this as SuccessState).onSuccessFunction);
          }
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = Constant.empty,
      Function? closeDialogFunction,
      int? progress}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
              stateRendererType: stateRendererType,
              message: message,
              title: title,
              actionFunction: () {},
              closeDialogFunction: closeDialogFunction,
            )).then((value) => {
          closeDialogFunction?.call(),
        }));
  }
}
