import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uni_junction/features/event/controllers/event/event_controller.dart';
import 'package:uni_junction/utils/constants/colors.dart';
import 'package:uni_junction/utils/constants/sizes.dart';
import 'package:uni_junction/utils/constants/text_strings.dart';
import 'package:uni_junction/utils/validator/validation.dart';

class TCreateEventForm extends StatelessWidget {
  const TCreateEventForm({
    super.key,
    required this.controller,
  });

  final EventController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: controller.eventFormKey,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    const SizedBox(height: TSizes.spaceBtwSections * 2),
                    Text(
                      "Welcome to event creation!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.primary),
                    ),
                    const SizedBox(height: TSizes.sm),
                    Center(
                      child: Text(
                        "Feel free to create your event, and share it with the world! 🌍",
                        textAlign: TextAlign.center, // Center align the text
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: TColors.primary),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections * 2),
                    TextFormField(
                      controller: controller.title,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Iconsax.activity),
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
                            child: Icon(Iconsax.designtools),
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
                            child: Icon(Iconsax.location),
                          ),
                        ),
                        labelText: TTexts.eventLocation,
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.eventUrl,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Iconsax.info_circle),
                          ),
                        ),
                        labelText: TTexts.eventUrl,
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.selectedEventCategory.value,
                      validator: (value) => TValidator.validationEmptyText(
                          "Event Category", value),
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Iconsax.activity),
                          ),
                        ),
                        labelText: "Select a category",
                      ),
                      items: controller.eventCategoryList
                          .map((String eventCategory) {
                        return DropdownMenuItem<String>(
                          alignment: Alignment.topCenter,
                          value: eventCategory,
                          child: Container(
                            width: 200,
                            child: Text(
                              eventCategory,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newCategory) {
                        if (newCategory != null) {
                          controller.selectedEventCategory.value = newCategory;
                        }
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.headCount,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Iconsax.people),
                          ),
                        ),
                        labelText: "Total Head Count",
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.startDate,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Iconsax.calendar_1),
                                ),
                              ),
                              labelText: TTexts.eventstartDate,
                            ),
                            readOnly: true,
                            onTap: () => controller.selectDate(context),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: controller.endDate,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Iconsax.calendar_1),
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
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Iconsax.clock),
                                ),
                              ),
                              labelText: TTexts.eventTime,
                            ),
                            onTap: () async {
                              final TimeOfDay? timeOfDay = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                initialEntryMode: TimePickerEntryMode.input,
                              );
                              if (timeOfDay != null) {
                                // update the controller
                                final period = timeOfDay.period == DayPeriod.am
                                    ? 'am'
                                    : 'pm';
                                final hour = timeOfDay.hourOfPeriod == 0
                                    ? 12
                                    : timeOfDay.hourOfPeriod;
                                final minute =
                                    timeOfDay.minute.toString().padLeft(2, '0');
                                controller.startTime.text =
                                    '$hour:$minute $period';
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
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Iconsax.clock),
                                ),
                              ),
                              labelText: TTexts.eventEndTime,
                            ),
                            onTap: () async {
                              final TimeOfDay? timeOfDay2 =
                                  await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                initialEntryMode: TimePickerEntryMode.input,
                              );
                              if (timeOfDay2 != null) {
                                final period = timeOfDay2.period == DayPeriod.am
                                    ? 'am'
                                    : 'pm';
                                final hour = timeOfDay2.hourOfPeriod == 0
                                    ? 12
                                    : timeOfDay2.hourOfPeriod;
                                final minute = timeOfDay2.minute
                                    .toString()
                                    .padLeft(2, '0');
                                controller.endTime.text =
                                    '$hour:$minute $period';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 24,
                                child: Checkbox(
                                  value: controller.isOnline.value,
                                  onChanged: (value) =>
                                      controller.isOnline(value!),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'is this a virtual event?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 24,
                                child: Checkbox(
                                  value: controller.isPrivate.value,
                                  onChanged: (value) =>
                                      controller.isPrivate(value!),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Is this a private event?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (controller.isPrivate.value)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: TSizes.spaceBtwItems),
                                const Text(
                                  "If yes, select your university",
                                ),
                                const SizedBox(height: TSizes.md),
                                DropdownButtonFormField<String>(
                                  value: controller.selectedUniversity.value,
                                  validator: (value) =>
                                      TValidator.validationEmptyText(
                                          "University", value),
                                  decoration: const InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(Iconsax.activity),
                                      ),
                                    ),
                                    labelText: TTexts.university,
                                  ),
                                  items: controller.universityList
                                      .map((String university) {
                                    return DropdownMenuItem<String>(
                                      alignment: Alignment.topCenter,
                                      value: university,
                                      child: Container(
                                        width: 200,
                                        child: Text(
                                          university,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      controller.selectedUniversity.value =
                                          newValue;
                                    }
                                  },
                                ),
                                const SizedBox(height: TSizes.spaceBtwSections),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 24,
                                child: Checkbox(
                                  value: controller.isOrg.value,
                                  onChanged: (value) =>
                                      controller.isOrg(value!),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            'Is this organized by an organization?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              )
                            ],
                          ),
                          if (controller.isOrg.value)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: TSizes.spaceBtwItems),
                                const Text(
                                  "If yes, enter your organization name",
                                ),
                                const SizedBox(height: TSizes.md),
                                TextFormField(
                                  controller: controller.orgName,
                                  decoration: const InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(Iconsax.info_circle),
                                      ),
                                    ),
                                    labelText: "Organization Name",
                                  ),
                                ),
                                const SizedBox(height: TSizes.spaceBtwSections),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 24,
                                child: Checkbox(
                                  value: controller.isTicketed.value,
                                  onChanged: (value) =>
                                      controller.isTicketed(value!),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            'Will this event require a ticket?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              )
                            ],
                          ),
                          if (controller.isTicketed.value)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: TSizes.spaceBtwItems),
                                const Text(
                                  "If yes, enter your ticket price",
                                ),
                                const SizedBox(height: TSizes.md),
                                TextFormField(
                                  controller: controller.ticketPrice,
                                  decoration: const InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(Iconsax.money),
                                      ),
                                    ),
                                    labelText: "Ticket Price",
                                  ),
                                ),
                                const SizedBox(height: TSizes.spaceBtwSections),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections * 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => controller.addEvent(),
                          child: const Text("Submit")),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
