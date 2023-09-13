import 'package:flutter/material.dart';
import '../../Models/note_model.dart';
import '../../constants.dart';
import 'color_item.dart';

class EditNoteColorsListViewBuilder extends StatefulWidget {
  const EditNoteColorsListViewBuilder({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  State<EditNoteColorsListViewBuilder> createState() =>
      _EditNoteColorsListViewBuilderState();
}

class _EditNoteColorsListViewBuilderState
    extends State<EditNoteColorsListViewBuilder> {
  late int cutrrentIndex;
  @override
  void initState() {
    super.initState();
    cutrrentIndex = kColors.indexOf(Color(widget.noteModel.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  cutrrentIndex = index;
                  widget.noteModel.color = kColors[index].value;
                });
              },
              child: ColorItem(
                isActive: cutrrentIndex == index,
                color: kColors[index],
              ),
            );
          }),
    );
  }
}
