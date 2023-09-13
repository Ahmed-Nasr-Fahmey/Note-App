import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Cubits/AddNoteCubit/add_note_state.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/constants.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());

  Color color = const Color(0xffF2ECBE);

  void addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFaliureState(erorrMessage: e.toString()));
    }
  }

  void formatAndAddNote({required String title, required String subTitle}) {
    NoteModel noteModel = NoteModel(
      title: title,
      supTitle: subTitle,
      date: DateFormat('EEEE, d MMM, yyyy').format(DateTime.now()).toString(),
      color: color.value,
    );
    addNote(noteModel);
  }
}
