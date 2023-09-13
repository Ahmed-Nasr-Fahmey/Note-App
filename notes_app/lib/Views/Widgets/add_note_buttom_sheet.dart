import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/AddNoteCubit/add_note_cubit.dart';
import 'package:notes_app/Cubits/AddNoteCubit/add_note_state.dart';
import 'package:notes_app/Cubits/NotesCubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccessState) {
            BlocProvider.of<NoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
          if (state is AddNoteFaliureState) {
            debugPrint('Failed ${state.erorrMessage}');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: AbsorbPointer(
              absorbing: state is AddNoteLoadingState ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
