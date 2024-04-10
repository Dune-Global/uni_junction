import "package:flutter/material.dart";
import "package:uni_junction/common/widgets/appbar/appbar.dart";

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Center(child: Text('Event Details')),
      ),
      body: Center(child: Text("EVENT DETAILS")),
    );
  }
}
