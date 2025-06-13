import 'package:flutter/material.dart';

import '../../core/ui/error_indicator.dart';
import '../view_models/study_viewmodel.dart';
import '../../core/localization/applocalization.dart';
import 'category_panel.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key, required this.viewModel});
  final StudyViewModel viewModel;

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalization.of(context).studyTitle)),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, child) {
            if (widget.viewModel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (widget.viewModel.load.error) {
              return ErrorIndicator(
                title: AppLocalization.of(context).errorLoadingCategories,
                label: AppLocalization.of(context).tryAgain,
                onPressed: widget.viewModel.load.execute,
              );
            }

            return child!;
          },
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, child) {
              return CategoryPanel(viewModel: widget.viewModel);
            },
          )
        ),
      ),
    );
  }
}
