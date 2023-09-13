import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/NotesCubit/notes_cubit.dart';
import 'package:notes_app/Views/Widgets/custom_app_bar.dart';
import 'notes_list_view_builder.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(
            icon: Icon(
              Icons.search,
              size: 32,
            ),
            text: 'Notes',
          ),
          SizedBox(
            height: 10,
          ),
          NotesListViewBuilder(),
          
        ],
      ),
    );
  }
}
