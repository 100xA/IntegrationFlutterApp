import 'package:equatable/equatable.dart';

import '../repo/profile.dart';

class ProfileState extends Equatable {
  final Profile? profile;
  final bool loading;

  const ProfileState({
    this.profile,
    this.loading = true,
  });

  ProfileState copyWith({
    Profile? profile,
    bool? loading,
  }) =>
      ProfileState(
        profile: profile ?? this.profile,
        loading: loading ?? this.loading,
      );

  @override
  List<Object?> get props => [profile, loading];
}
