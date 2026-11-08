import 'package:flutter/material.dart';
import 'package:wayve/features/events/presentation/widgets/image_bg_card.dart';
import 'package:wayve/features/events/presentation/widgets/upcoming_event_card.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Events")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Current Event",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text("October 10, 2025"),
                  ],
                ),

                ImageBackgroundCard(
                  imageUrl: 'https://picsum.photos/200/300',
                  title: "Sample",
                  subtitle: "You have this fun event upcoming",
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Upcoming Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return UpcomingEventCard(
                  imageUrl: 'https://picsum.photos/200/300',
                  eventTitle: 'Event $index',
                  subtitle: "You have this fun event upcoming",
                  date: "October $index, 2025",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
