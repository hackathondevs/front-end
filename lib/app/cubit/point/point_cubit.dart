import 'package:bloc/bloc.dart';
import 'package:zooventure/data/repositories/point_repositories.dart';
import 'package:meta/meta.dart';

part 'point_state.dart';

class PointCubit extends Cubit<PointState> {
  PointCubit() : super(PointInitial());

  final PointRepository _pointRepository = PointRepository();

  void changePoint(int amount, String code) async {
    emit(ChangePointLoading());
    try {
      var response = await _pointRepository.changePoint(amount, code);

      if (response) {
        emit(ChangePointSuccess());
      } else {
        emit(ChangePointFailed(error: "Failed Change Point"));
      }
    } catch (e) {
      emit(ChangePointFailed(error: e.toString()));
    }
  }
}
