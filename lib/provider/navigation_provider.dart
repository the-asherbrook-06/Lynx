// Packages
import 'package:flutter_riverpod/legacy.dart';

final railExpandedProvider = StateProvider<bool>((_) => false);
final railIndexProvider = StateProvider<int>((_) => 0);