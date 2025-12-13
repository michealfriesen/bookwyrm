import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../files/ui/file_page.dart';
import '../../graph/ui/graph_page.dart';
import '../../quiz/ui/quiz_page.dart';
import '../../profile/ui/profile_page.dart';
import '../state/tab_index_provider.dart';

/// Main bottom-tab scaffold for the app.
class MainTabNavigator extends ConsumerWidget {
  const MainTabNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabIndexProvider);

    final screens = <Widget>[
      const GraphPage(),
      const FilePickerScreen(),
      const QuizScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(tabIndexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart),
            label: 'Graph',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: 'Files',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}