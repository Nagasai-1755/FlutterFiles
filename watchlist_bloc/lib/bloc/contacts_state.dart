import 'package:watchlist_bloc/model/user_model.dart';

abstract class ContactsState{}

class ContactLoadingState extends ContactsState{}

class ContactLoadedState extends ContactsState{
  final List<UserModel> users;
  ContactLoadedState(this.users);
}

class ContactErrorState extends ContactsState{
  final String error = 'Failed';
}