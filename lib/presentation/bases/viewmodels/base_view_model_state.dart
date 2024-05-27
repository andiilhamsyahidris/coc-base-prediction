part of 'base_view_model_bloc.dart';

class BaseViewModelEmpty extends EmptyState {
  BaseViewModelEmpty(super.message);
}

class BaseViewModelLoading extends LoadingState {
  BaseViewModelLoading({required super.stateRendererType});
}

class BaseViewModelError extends ErrorState {
  BaseViewModelError(super.stateRendererType, super.message);
}

class BaseViewModelSuccess extends SuccessState {
  BaseViewModelSuccess(super.message, super.onSuccessFunction);
}

class BaseViewModelContent extends ContentState {}
