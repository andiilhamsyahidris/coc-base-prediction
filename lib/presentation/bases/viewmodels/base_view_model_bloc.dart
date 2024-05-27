import 'package:bloc/bloc.dart';
import 'package:coc_base_prediction/presentation/bases/resources/string_res.dart';
import 'package:coc_base_prediction/presentation/bases/states/state_renderer.dart';
import 'package:coc_base_prediction/presentation/bases/states/state_renderer_impl.dart';
import 'package:easy_localization/easy_localization.dart';

part 'base_view_model_event.dart';
part 'base_view_model_state.dart';

class BaseViewModelBloc extends Bloc<BaseViewModelEvent, FlowState> {
  BaseViewModelBloc() : super(BaseViewModelEmpty(CocStrings.empty.tr())) {
    on<FetchContent>((event, emit) {
      emit(BaseViewModelLoading(
        stateRendererType: StateRendererType.fullscreenSuccessState,
      ));
    });
  }
}
