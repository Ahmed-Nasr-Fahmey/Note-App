import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/AddNoteCubit/add_note_cubit.dart';
import '../../constants.dart';
import 'color_item.dart';

class ColorsListViewBuilder extends StatefulWidget {
  const ColorsListViewBuilder({super.key});

  @override
  State<ColorsListViewBuilder> createState() => _ColorsListViewBuilderState();
}

class _ColorsListViewBuilderState extends State<ColorsListViewBuilder> {
  int cutrrentIndex = 0;

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
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                  cutrrentIndex = index;
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
