import 'package:flutter/material.dart';
import 'package:wayve/features/events/presentation/widgets/image_bg_card.dart';
import 'package:wayve/features/groups/presentation/screen/group_form.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  void _openBottomSheetForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            kToolbarHeight,
      ),
      builder: (BuildContext ctx) {
        return const GroupForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groups"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openBottomSheetForm(context),
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "My Groups",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 15,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 12, // Horizontal spacing between columns
                mainAxisSpacing: 12, // Vertical spacing between rows
                childAspectRatio: 0.8, // Width to height ratio (width / height)
              ),
              itemBuilder: (context, index) {
                return ImageBackgroundCard(
                  imageUrl: 'https://picsum.photos/200/300',
                  title: "Group $index",
                  subtitle: "a fun group to hang out with",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
