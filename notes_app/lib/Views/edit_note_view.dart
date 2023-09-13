import 'package:flutter/material.dart';
import 'package:notes_app/Models/note_model.dart';
import 'Widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return EditNoteViewBody(noteModel: noteModel,);
  }
}
