import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_match/src/modules/premiere_league_id_sscreen/presentation/controller/premiere_league_id_screen_state.dart';

class PremiereLeagueIdScreenCubit extends Cubit<PremiereLeagueIdScreenState> {
  PremiereLeagueIdScreenCubit() : super(PremiereLeagueIdScreenInitial());
}
