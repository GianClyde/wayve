import 'package:flutter_bloc/flutter_bloc.dart';

class GroupFormState {
  final List<String> selectedMembers;

  const GroupFormState({
    this.selectedMembers = const [],
  });

  GroupFormState copyWith({
    List<String>? selectedMembers,
  }) {
    return GroupFormState(
      selectedMembers: selectedMembers ?? this.selectedMembers,
    );
  }
}

class GroupFormCubit extends Cubit<GroupFormState> {
  GroupFormCubit() : super(const GroupFormState());

  void addMember(String member) {
    final trimmed = member.trim();
    if (trimmed.isEmpty || state.selectedMembers.contains(trimmed)) return;

    emit(state.copyWith(
      selectedMembers: [...state.selectedMembers, trimmed],
    ));
  }

  void removeMemberAt(int index) {
    if (index < 0 || index >= state.selectedMembers.length) return;
    final updated = List<String>.from(state.selectedMembers)..removeAt(index);
    emit(state.copyWith(selectedMembers: updated));
  }

  void removeMember(String member) {
    final updated = List<String>.from(state.selectedMembers)..remove(member);
    emit(state.copyWith(selectedMembers: updated));
  }

  void clearMembers() {
    emit(state.copyWith(selectedMembers: const []));
  }
}
