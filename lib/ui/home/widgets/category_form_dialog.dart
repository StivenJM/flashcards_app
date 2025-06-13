import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/category/category.dart';
import '../view_models/home_viewmodel.dart';
import '../../core/localization/applocalization.dart';

class CategoryFormDialog extends StatefulWidget {
  final HomeViewModel viewModel;
  final Category? initialCategory; // null para crear, no null para editar

  const CategoryFormDialog({super.key, required this.viewModel, this.initialCategory});

  @override
  State<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<CategoryFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late Color _color;

  @override
  void initState() {
    super.initState();
    _name = widget.initialCategory?.name ?? '';
    _description = widget.initialCategory?.description ?? '';
    _color = widget.initialCategory != null 
      ? Color(widget.initialCategory!.color) 
      : Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialCategory != null;
    return AlertDialog(
      title: Text(isEdit ? AppLocalization.of(context).editCategory : AppLocalization.of(context).addCategory),
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CustomizedTextFormField(
              label: 'Name', 
              initialValue: _name,
              validator: (value) => value == null || value.isEmpty 
                ? AppLocalization.of(context).required 
                : null,
              onChanged: (value) => _name = value,
            ),
            SizedBox(height: 16),
            _CustomizedTextFormField(
              label: 'Description', 
              initialValue: _description,
              validator: (value) => value == null || value.isEmpty 
                ? AppLocalization.of(context).required 
                : null,
              onChanged: (value) => _description = value,
            ),
            SizedBox(height: 48),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Color'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...[
                    Colors.blue,
                    Colors.purple,
                    Colors.green,
                    Colors.orange,
                    Colors.red,
                    Colors.lightBlue,
                    Colors.lightGreen,
                    Colors.orangeAccent,
                  ].map((color) => Padding(
                    padding: EdgeInsetsGeometry.all(4.0),
                    child: ChoiceChip(
                      label: const SizedBox(width: 16, height: 16),
                      selected: _color.toARGB32() == color.toARGB32(),
                      selectedColor: color,
                      backgroundColor: color,
                      onSelected: (_) => setState(() => _color = color),
                      shape: _color.toARGB32() == color.toARGB32()
                        ? const StadiumBorder() // Selected Rounded
                        : RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                      side: BorderSide(
                        color: _color.toARGB32() == color.toARGB32() ? Colors.black : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ],
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
              final viewModel = widget.viewModel;
              if (isEdit) {
                viewModel.updateCategory.execute(widget.initialCategory!.copyWith(
                  name: _name,
                  description: _description,
                  color: _color.toARGB32(),
                ));
              } else {
                viewModel.addCategory.execute(Category(
                  id: UniqueKey().toString(),
                  name: _name,
                  description: _description,
                  color: _color.toARGB32(),
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
  }): super(key: key);

  final String label;
  final String initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context).colorScheme;
    return TextFormField(
      initialValue: initialValue,
      style: const TextStyle(fontSize: 17),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
        errorStyle: TextStyle(color: themeColor.onError), // Red error message
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: themeColor.onError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: themeColor.onError, width: 1),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}