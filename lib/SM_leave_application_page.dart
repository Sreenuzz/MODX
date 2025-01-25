import 'package:flutter/material.dart';

class LeaveApplicationPage extends StatefulWidget {
  const LeaveApplicationPage({Key? key}) : super(key: key);
  @override
  _LeaveApplicationPageState createState() => _LeaveApplicationPageState();
}

class _LeaveApplicationPageState extends State<LeaveApplicationPage> {
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  String _leaveType = 'Sick Leave'; // Default leave type
  final List<String> _leaveTypes = ['Sick Leave', 'Casual Leave', 'Medical Leave'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_startDate == null || _endDate == null) {
        _showSnackBar('Please select both start and end dates.');
        return;
      }

      // Collect form data
      String name = _nameController.text;
      String rollNumber = _rollNumberController.text;
      String studentClass = _classController.text;
      String reason = _reasonController.text;

      // Show success message (you can replace this with an API call)
      _showSnackBar('Leave application submitted successfully!');

      // Reset the form
      _formKey.currentState!.reset();
      _nameController.clear();
      _rollNumberController.clear();
      _classController.clear();
      _reasonController.clear();
      setState(() {
        _startDate = null;
        _endDate = null;
        _leaveType = 'Sick Leave';
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pickDate(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Leave Application'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apply for Leave',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _nameController,
                    label: 'Student Name',
                    hint: 'Enter your full name',
                    icon: Icons.person,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _rollNumberController,
                    label: 'Roll Number',
                    hint: 'Enter your roll number',
                    icon: Icons.numbers,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _classController,
                    label: 'Class/Grade',
                    hint: 'Enter your class or grade',
                    icon: Icons.school,
                  ),
                  SizedBox(height: 16),
                  _buildDropdown(),
                  SizedBox(height: 16),
                  _buildDatePicker(
                    label: 'Start Date',
                    selectedDate: _startDate,
                    onTap: () => _pickDate(context, true),
                  ),
                  SizedBox(height: 16),
                  _buildDatePicker(
                    label: 'End Date',
                    selectedDate: _endDate,
                    onTap: () => _pickDate(context, false),
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _reasonController,
                    label: 'Reason for Leave',
                    hint: 'Explain your reason for leave',
                    icon: Icons.description,
                    maxLines: 3,
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: _submitForm,
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill out this field';
        }
        return null;
      },
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: _leaveType,
      decoration: InputDecoration(
        labelText: 'Type of Leave',
        prefixIcon: Icon(Icons.category),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: _leaveTypes
          .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _leaveType = value!;
        });
      },
    );
  }

  Widget _buildDatePicker({
    required String label,
    required DateTime? selectedDate,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? label
                  : '${selectedDate.toLocal()}'.split(' ')[0],
              style: TextStyle(
                fontSize: 16,
                color: selectedDate == null ? Colors.grey : Colors.black,
              ),
            ),
            Icon(Icons.calendar_today, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rollNumberController.dispose();
    _classController.dispose();
    _reasonController.dispose();
    super.dispose();
  }
}
