import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab_index_provider.g.dart';

@riverpod
class TabIndexP extends _$TabIndexP {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
