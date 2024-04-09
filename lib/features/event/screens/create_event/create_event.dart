import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventController());
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
                  key: controller.eventFormKey,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.title,
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
                            controller: controller.description,
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
                            controller: controller.location,
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
                                  controller: controller.startDate,
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
                                  onTap: () => controller.selectDate(context),
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      10), // Add some space between the fields
                              Expanded(
                                child: TextFormField(
                                  controller: controller.endDate,
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
                                  onTap: () => controller.selectEndDate(context),
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
                                  controller: controller.startTime,
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
                                      initialTime: TimeOfDay.now(),
                                      initialEntryMode:
                                          TimePickerEntryMode.input,
                                    );
                                    if (timeOfDay != null) {
                                      // update the controller
                                      controller.startTime.text =
                                          timeOfDay.format(context);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.endTime,
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
                                      initialTime: TimeOfDay.now(),
                                      initialEntryMode:
                                          TimePickerEntryMode.input,
                                    );
                                    if (timeOfDay2 != null) {
                                      // update the controller
                                      controller.endTime.text =
                                          timeOfDay2.format(context);
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
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () => controller.addEvent(),
                                child: const Text("Submit")),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
