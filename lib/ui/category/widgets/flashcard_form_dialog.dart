import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/flashcard/flashcard.dart';
import '../view_models/category_detail_viewmodel.dart';

class FlashcardFormDialog extends StatefulWidget {
  final Flashcard? initialFlashcard; // null para crear, no null para editar
  final String categoryId;

  const FlashcardFormDialog({
    super.key,
    this.initialFlashcard,
    required this.categoryId,
  });

  @override
  State<FlashcardFormDialog> createState() => _FlashcardFormDialogState();
}

class _FlashcardFormDialogState extends State<FlashcardFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _front;
  late String _back;
  late int _difficulty;

  @override
  void initState() {
    super.initState();
    _front = widget.initialFlashcard?.front ?? '';
    _back = widget.initialFlashcard?.back ?? '';
    _difficulty = widget.initialFlashcard?.difficulty ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialFlashcard != null;
    final title = isEdit ? 'Edit Flashcard' : 'New Flashcard';

    return AlertDialog(
      title: Text(title),
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _CustomizedTextFormField(
                label: 'Front (Question)',
                initialValue: _front,
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                onChanged: (value) => _front = value,
              ),
              const SizedBox(height: 16),
              _CustomizedTextFormField(
                label: 'Back (Answer)',
                initialValue: _back,
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                onChanged: (value) => _back = value,
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Difficulty', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _DifficultyChip(
                    label: 'EASY',
                    selected: _difficulty == 0,
                    onTap: () => setState(() => _difficulty = 0),
                  ),
                  _DifficultyChip(
                    label: 'MEDIUM',
                    selected: _difficulty == 1,
                    onTap: () => setState(() => _difficulty = 1),
                  ),
                  _DifficultyChip(
                    label: 'HARD',
                    selected: _difficulty == 2,
                    onTap: () => setState(() => _difficulty = 2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final viewModel = context.read<CategoryDetailViewModel>();
              if (isEdit) {
                viewModel.updateFlashcard.execute(widget.initialFlashcard!.copyWith(
                  back: _back,
                  front: _front,
                  categoryId: widget.categoryId,
                  createdAt: widget.initialFlashcard!.createdAt,
                  difficulty: _difficulty,
                  updatedAt: DateTime.now()
                ));
              } else {
                viewModel.addFlashcard.execute(Flashcard(
                  id: UniqueKey().toString(),
                  back: _back,
                  front: _front,
                  categoryId: widget.initialFlashcard!.categoryId,
                  createdAt: DateTime.now(),
                  difficulty: _difficulty,
                  updatedAt: DateTime.now()
                ));
              }
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _CustomizedTextFormField extends StatelessWidget {
  const _CustomizedTextFormField({
    required this.label,
    required this.initialValue,
    this.onChanged,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String label;
  final String initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int lines = 3;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: const TextStyle(fontSize: 17),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      maxLines: lines,
      minLines: lines,
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _DifficultyChip({
    required this.label,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  Color _backgroundColor(String label) {
    switch (label) {
      case 'EASY':
        return Colors.green.shade300;
      case 'MEDIUM':
        return Colors.orange.shade300;
      case 'HARD':
        return Colors.red.shade300;
      default:
        return Colors.grey.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: _backgroundColor(label),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? Colors.black87 : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
