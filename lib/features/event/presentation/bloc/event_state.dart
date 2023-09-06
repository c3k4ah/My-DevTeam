part of 'event_bloc.dart';

abstract class EventState extends Equatable {
  const EventState();  

  @override
  List<Object> get props => [];
}
class EventInitial extends EventState {}
