import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/helpers/convert_date_to_shamsi.dart';
import 'package:tikino/data/model/for_providers/priority.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/presentation/widgets/textfields/add_todo/dialog_text_fields.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {

  final _titleController = TextEditingController();

  DateTime? _selectedDueDate;
  TodoPriority _selectedPriority = TodoPriority.medium;

  int? taskSelectedColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          'افزودن کار جدید',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      content: Column(
        children: [

          // title
          AddTodoTextFieldCustom(
            hintText: 'عنوانی را وارد کنید',
            controller: _titleController,
          ),

          const SizedBox(height: 16),

          // priority
          taskPriorityLevelDropDownField(),

          const SizedBox(height: 16),

          // Date time
          Expanded(
            child: datePickerForTask(),
          ),

          const SizedBox(height: 16),

          // Color value
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                chooseColorIconButton(Colors.red),
        
                chooseColorIconButton(Colors.blueAccent),
        
                chooseColorIconButton(Colors.green),
        
                chooseColorIconButton(Colors.purpleAccent),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.0,
          children: [
            TextButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(24, 12, 24, 12)),
                backgroundColor: WidgetStatePropertyAll(Colors.red.shade800),
              ),
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text(
                'لغو',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),

            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(32, 12, 32, 12)),
                backgroundColor: WidgetStatePropertyAll(Colors.deepPurple[800])
              ),
              onPressed: () => addTodo(), 
              child: Text(
                'افزودن',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              )
            ),
          ],
        )
      ],
    );
  }

  InkWell datePickerForTask() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: _pickDueDate,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          _selectedDueDate == null
              ? 'تاریخ انجام را انتخاب کنید'
              : '📅  ${formatJalali(_selectedDueDate!)}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  DropdownButtonFormField<TodoPriority> taskPriorityLevelDropDownField() {
    return DropdownButtonFormField<TodoPriority>(
      initialValue: _selectedPriority,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: TodoPriority.low,
          child: Text('کم'),
        ),
        DropdownMenuItem(
          value: TodoPriority.medium,
          child: Text('متوسط'),
        ),
        DropdownMenuItem(
          value: TodoPriority.high,
          child: Text('زیاد'),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedPriority = value;
          });
        }
      },
    );
  }

  Material chooseColorIconButton(Color color) {

    final isSelected = taskSelectedColor == color.toARGB32();


    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.white.withValues(alpha: .7),
        onTap: () {
          setState(() {
            taskSelectedColor = color.toARGB32();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              isSelected ? BoxShadow(
                color: color.withValues(alpha: .4),
                offset: Offset(0, -4),
                blurRadius: 20,
                spreadRadius: 2,
              ) : BoxShadow(
                color: Colors.transparent,
              ),
            ]
          ),
          height: 50,
          width: 50,
          child: Icon(
            Icons.check,
            color: isSelected 
              ? Colors.white
              : Colors.transparent,
          ),
        ),
      ),
    );
  }

  Future<void> _pickDueDate() async {
    final picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali.now(),
      lastDate: Jalali(1500, 1),
      holidayConfig: PersianHolidayConfig(
        weekendDays: {7}
      ),
      initialEntryMode: PersianDatePickerEntryMode.calendarOnly,
      initialDatePickerMode: PersianDatePickerMode.day,
    );

    if (picked != null) {
      setState(() {
        _selectedDueDate = picked.toDateTime();
      });
    }
  }

  void addTodo() {

    final title = _titleController.text.trim();

    if (title.isNotEmpty) {
      Provider.of<Todoprovider>(
        context,
        listen: false
      ).addTodo(
        title: title,
        colorValue: taskSelectedColor ?? 0xFF7B61FF,
        dueDate: _selectedDueDate,
        priority: _selectedPriority,
      );

      Navigator.pop(context);
    }
  }
}