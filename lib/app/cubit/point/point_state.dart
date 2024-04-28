part of 'point_cubit.dart';

@immutable
sealed class PointState {}

final class PointInitial extends PointState {}

final class ChangePointLoading extends PointState {}

final class ChangePointSuccess extends PointState {}

final class ChangePointFailed extends PointState {
  final String error;
  ChangePointFailed({required this.error});
}
