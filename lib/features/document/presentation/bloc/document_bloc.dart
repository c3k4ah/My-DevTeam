import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc() : super(DocumentInitial()) {
    on<DocumentEvent>((event, emit) {});
  }
}
