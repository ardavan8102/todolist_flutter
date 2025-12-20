import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/core/helpers/convert_date_to_shamsi.dart';
import 'package:tikino/data/lists/category_data.dart';
import 'package:tikino/data/model/for_providers/priority.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/presentation/widgets/appbars/appbar_with_actions.dart';
import 'package:tikino/presentation/widgets/textfields/add_todo/dialog_text_fields.dart';
import 'package:tikino/presentation/widgets/texts/section_title.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _titleController = TextEditingController();

  DateTime? _selectedDueDate;

  TodoPriority _selectedPriority = TodoPriority.medium;

  int? taskSelectedColor = AppSolidColors.primary.toARGB32();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWithActionButtons(
        title: 'کار جدید',
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 30,
            ),
          ),
          
          const SizedBox(width: 24),
        ],
        bgColor: Color(taskSelectedColor!),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(context).viewInsets.bottom + 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SectionTitle(title: 'نام کار جدید'),

              const SizedBox(height: 12),

              // title
              AddTodoTextFieldCustom(
                hintText: 'عنوانی را وارد کنید',
                controller: _titleController,
              ),
        
              const SizedBox(height: 30),

              SectionTitle(title: 'اولویت کار جدید'),

              const SizedBox(height: 12),
        
              // priority
              taskPriorityLevelDropDownField(),
        
              const SizedBox(height: 30),

              SectionTitle(title: 'مهلت انجام کار'),

              const SizedBox(height: 12),
        
              // date picker
              datePickerForTask(),
        
              const SizedBox(height: 30),

              SectionTitle(title: 'رنگ مشخصه کار'),

              const SizedBox(height: 12),

              SizedBox(
                height: size.height * .1,
                width: size.width,
                child: ListView.builder(
                  itemCount: categoryColors.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    
                    final color = categoryColors[index];

                    return Padding(
                      padding: index == categoryColors.length - 1
                        ? const EdgeInsetsGeometry.fromLTRB(0, 20, 10, 20)
                        : index == 0
                          ? const EdgeInsetsGeometry.fromLTRB(10, 20, 0, 20)
                          : const EdgeInsetsGeometry.fromLTRB(10, 20, 10, 20),
                      child: chooseColorIconButton(color),
                    );
                  },
                ),
              ),
        
              const SizedBox(height: 50),
        
              SizedBox(
                height: size.height * .1,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          padding: const WidgetStatePropertyAll(
                            EdgeInsets.fromLTRB(24, 12, 24, 12),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.red.shade800),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'لغو',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                        
                    const SizedBox(width: 10),
                        
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: const WidgetStatePropertyAll(
                            EdgeInsets.fromLTRB(32, 12, 32, 12),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(Color(taskSelectedColor!)),
                        ),
                        onPressed: addTodo,
                        child: const Text(
                          'افزودن',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              isSelected
                  ? BoxShadow(
                      color: color.withValues(alpha: .5),
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 3,
                    )
                  : const BoxShadow(color: Colors.transparent),
            ],
          ),
          child: Icon(
            Icons.check,
            color: isSelected ? Colors.white : Colors.transparent,
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
      holidayConfig: const PersianHolidayConfig(
        weekendDays: {7},
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
        listen: false,
      ).addTodo(
        title: title,
        colorValue: taskSelectedColor!,
        dueDate: _selectedDueDate,
        priority: _selectedPriority,
      );

      Navigator.pop(context);
    }
  }
}