part of 'document_bloc.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();  

  @override
  List<Object> get props => [];
}
class DocumentInitial extends DocumentState {}
