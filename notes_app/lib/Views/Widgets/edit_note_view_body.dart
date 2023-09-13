import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/NotesCubit/notes_cubit.dart';
import 'package:notes_app/Models/note_model.dart';
import 'custom_app_bar.dart';
import 'custom_text_form_field.dart';
import 'edit_note_colors_list_view_builder.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, supTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.supTitle =
                      supTitle ?? widget.noteModel.supTitle;
                  widget.noteModel.save();
                  BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                child: const CustomAppBar(
                  icon: Icon(
                    Icons.check,
                    size: 32,
                  ),
                  text: 'Edit Note',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                initialValue: widget.noteModel.title,
                onChanged: (value) {
                  title = value;
                },
                hintText: 'Title',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                initialValue: widget.noteModel.supTitle,
                onChanged: (value) {
                  supTitle = value;
                },
                hintText: 'Content',
                maxLines: 5,
              ),
              const SizedBox(
                height: 30,
              ),
              EditNoteColorsListViewBuilder(
                noteModel: widget.noteModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
