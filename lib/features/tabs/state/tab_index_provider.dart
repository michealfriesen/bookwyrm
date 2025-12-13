import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the currently selected bottom-tab index.
final tabIndexProvider = StateProvider<int>((ref) => 0);