import 'package:coc_base_prediction/app/constant.dart';
import 'package:coc_base_prediction/presentation/bases/resources/asset_res.dart';
import 'package:coc_base_prediction/presentation/bases/resources/color_res.dart';
import 'package:coc_base_prediction/presentation/bases/resources/string_res.dart';
import 'package:coc_base_prediction/presentation/bases/resources/value_res.dart';
import 'package:coc_base_prediction/presentation/widgets/coc_filled_button.dart';
import 'package:coc_base_prediction/presentation/widgets/coc_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType {
  // POPUP STATES
  popupLoadingState,
  popupErrorState,
  popupSuccess,
  // FULL SCREEN STATES
  fullscreenLoadingState,
  fullscreenSuccessState,
  fullscreenErrorState,
  contentScreenState, // THE UI OF THE SCREEN
  chooseAccountState, // CHOOSE ACCOUNT SCREEN
  emptyScreenState // EMPTY VIEW WHEN WE RECEIVE NO DATA FROM API SIDE FOR LIST SCREEN
}

// ignore: must_be_immutable
class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  String? textButton;
  Function? actionFunction;
  Function? closeDialogFunction;

  StateRenderer({
    super.key,
    required this.stateRendererType,
    String? message,
    String? title,
    required this.actionFunction,
    this.textButton,
    this.closeDialogFunction,
  })  : message = message ?? CocStrings.loading.tr(),
        title = title ?? Constant.empty;

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(CocAnimAssets.loading),
          _getMessage(message),
        ]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(CocAnimAssets.failed),
          _getMessage(message),
          _getActionButton(CocStrings.close.tr(), context)
        ]);
      case StateRendererType.fullscreenSuccessState:
        return _getItemsInColumn([
          _getAnimatedImage(CocAnimAssets.success),
          _getMessage(message),
          _getActionButton(CocStrings.close.tr(), context)
        ]);
      case StateRendererType.popupSuccess:
        return _getPopUpDialog(context, [
          _getAnimatedImage(CocAnimAssets.success),
          _getMessage(title),
          _getMessage(message),
          _getActionButton(CocStrings.close.tr(), context)
        ]);
      case StateRendererType.fullscreenLoadingState:
        return _getItemsInColumn(
          [_getAnimatedImage(CocAnimAssets.loading), _getMessage(message)],
        );
      case StateRendererType.fullscreenErrorState:
        return _getItemsInColumn([
          _getAnimatedImage(CocAnimAssets.failed),
          _getMessage(message),
          _getActionButton(textButton ?? CocStrings.tryAgain.tr(), context)
        ]);
      case StateRendererType.contentScreenState:
        return Container();
      case StateRendererType.emptyScreenState:
        return _getItemsInColumn(
            [_getAnimatedImage(CocAnimAssets.empty), _getMessage(message)]);
      case StateRendererType.chooseAccountState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CocRadius.md)),
      elevation: CocElevation.level1,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: CocColor.bgColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(CocRadius.md),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: CocRadius.sm,
                  offset: Offset(CocSpace.noSpace, CocSpace.md))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: CocImageSize.thumbnailMd,
      width: CocImageSize.thumbnailMd,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(CocSpace.xs),
        child: CocText.bold(
          message,
          color: CocColor.textColorDark,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }

  Widget _getActionButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(CocSpace.lg),
        child: SizedBox(
          width: 180,
          child: CocFilledButton(
            onTap: () {
              if (stateRendererType == StateRendererType.fullscreenErrorState ||
                  stateRendererType ==
                      StateRendererType.fullscreenSuccessState) {
                actionFunction
                    ?.call(); // to call the API function again to retrys
              } else {
                Navigator.of(context)
                    .pop(); // popup state error so we need to dismiss the dialog
                closeDialogFunction?.call();
              }
            },
            text: buttonTitle,
            bgBtnColor: null,
          ),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
