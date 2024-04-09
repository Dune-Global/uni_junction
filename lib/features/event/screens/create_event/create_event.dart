import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _timeEndController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();
  final _firestore = FirebaseFirestore.instance;
  Future<void> _saveEvent() async {
    await _firestore.collection('events').add({
      'title': _titleController.text,
      'description': _descriptionController.text,
      'location': _locationController.text,
      'startDate': _dateController.text,
      'endDate': _endDateController.text,
      'startTime': _timeController.text,
      'endTime': _timeEndController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(TTexts.createEvent),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.event),
                            ),
                          ),
                          labelText: TTexts.eventTitle,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.event),
                            ),
                          ),
                          labelText: TTexts.eventDescription,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: _locationController,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.event),
                            ),
                          ),
                          labelText: TTexts.eventLocation,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _dateController,
                              decoration: const InputDecoration(
                                filled: true,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Icon(Icons.calendar_month),
                                  ),
                                ),
                                labelText: TTexts.eventstartDate,
                              ),
                              readOnly: true,
                              onTap: () {
                                _selectDate(context);
                              },
                            ),
                          ),
                          const SizedBox(
                              width: 10), // Add some space between the fields
                          Expanded(
                            child: TextFormField(
                              controller: _endDateController,
                              decoration: const InputDecoration(
                                filled: true,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Icon(Icons.calendar_month),
                                  ),
                                ),
                                labelText: TTexts.eventEndDate,
                              ),
                              readOnly: true,
                              onTap: () {
                                _selectEndDate(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _timeController,
                              decoration: const InputDecoration(
                                filled: true,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Icon(Icons.lock_clock),
                                  ),
                                ),
                                labelText: TTexts.eventTime,
                              ),
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                  context: context,
                                  initialTime: selectedTime,
                                  initialEntryMode: TimePickerEntryMode.input,
                                );
                                if (timeOfDay != null) {
                                  setState(() {
                                    selectedTime = timeOfDay;
                                    _timeController.text = selectedTime.format(
                                        context); // Update the text of the controller
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: _timeEndController,
                              decoration: const InputDecoration(
                                filled: true,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Icon(Icons.lock_clock),
                                  ),
                                ),
                                labelText: TTexts.eventEndTime,
                              ),
                              onTap: () async {
                                final TimeOfDay? timeOfDay2 =
                                    await showTimePicker(
                                  context: context,
                                  initialTime: selectedTime,
                                  initialEntryMode: TimePickerEntryMode.input,
                                );
                                if (timeOfDay2 != null) {
                                  setState(() {
                                    selectedTime = timeOfDay2;
                                    _timeEndController.text = selectedTime.format(
                                        context); // Update the text of the controller
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: _saveEvent, child: const Text("Submit")),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2028));
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context2) async {
    DateTime? _picked2 = await showDatePicker(
        context: context2,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2028));
    if (_picked2 != null) {
      setState(() {
        _endDateController.text = _picked2.toString().split(" ")[0];
      });
    }
  }
}
