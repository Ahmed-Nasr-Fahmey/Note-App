abstract class AddNoteState {}

class AddNoteInitialState extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState {}

class AddNoteSuccessState extends AddNoteState {}

class AddNoteFaliureState extends AddNoteState {
  final String erorrMessage;
  AddNoteFaliureState({required this.erorrMessage});
}
