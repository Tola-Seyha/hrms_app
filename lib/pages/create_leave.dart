import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateLeave extends StatefulWidget {
  const CreateLeave({super.key});

  @override
  State<CreateLeave> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<CreateLeave> {
  final _formKey = GlobalKey<FormState>();

  // State variables
  String? _selectedLeaveType;
  DateTimeRange? _selectedDateRange;
  final TextEditingController _reasonController = TextEditingController();

  final List<String> _leaveTypes = [
    'Annual Leave',
    'Sick Leave',
    'Casual Leave',
    'Unpaid Leave',
  ];

  // Helper to format date
  String _getRangeText() {
    if (_selectedDateRange == null) return "Select Dates";
    return "${DateFormat('MMM d').format(_selectedDateRange!.start)} - ${DateFormat('MMM d, y').format(_selectedDateRange!.end)}";
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedDateRange != null) {
      // Logic to send to API
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Leave Application Submitted Successfully!'),
        ),
      );
    } else if (_selectedDateRange == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date range')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Apply Leave", 
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amber,  
    
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 14.0, right: 14, top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Leave Balance Summary
              _buildBalanceCard(),
              const SizedBox(height: 30),

              // 2. Leave Type Dropdown
              const Text(
                "Leave Type",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration( 
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.category_outlined),
                ),
                hint: const Text("Select Type"),
                value: _selectedLeaveType,
                items: _leaveTypes
                    .map(
                      (type) =>
                          DropdownMenuItem(value: type, child: Text(type)),
                    )
                    .toList(),
                onChanged: (val) => setState(() => _selectedLeaveType = val),
                validator: (val) => val == null ? "Required field" : null,
              ),

              const SizedBox(height: 25),

              // 3. Date Range Picker
              const Text(
                "Duration",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  final picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null)
                    setState(() => _selectedDateRange = picked);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month, color: Colors.indigo),
                      const SizedBox(width: 12),
                      Text(
                        _getRangeText(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Spacer(),
                      if (_selectedDateRange != null)
                        Text(
                          "${_selectedDateRange!.duration.inDays + 1} Days",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // 4. Reason Field
              const Text(
                "Reason for Leave",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _reasonController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Briefly explain why...",
                  filled: true,
                  fillColor: Colors.grey[200],  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (val) =>
                    val!.isEmpty ? "Please provide a reason" : null,
              ),

              const SizedBox(height: 40),

              // 5. Submit Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _submitForm, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade500,   
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Submit Request",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // UI Component: Leave Balance Card
  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.shade400,       
        // color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [ 
          BoxShadow(  
            color: Colors.green.shade200, 
            blurRadius: 8,   
            offset: const Offset(0, 1), 
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( 
                "Annual Balance", 
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 5),
              Text( 
                "14 Days Left",
                style: TextStyle( 
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold, 
                ), 
              ), 
            ],
          ),
          Icon(Icons.event_available, color: Colors.white, size: 40),
        ], 
      ), 
    );
  }
}
