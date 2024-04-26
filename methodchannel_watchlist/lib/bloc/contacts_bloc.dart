import 'package:bloc/bloc.dart';
import 'package:watchlist_bloc/bloc/contacts_state.dart';
import 'package:watchlist_bloc/contact_repository.dart';

import 'contacts_event.dart';



class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactRepository _contactRepository;


  ContactsBloc(this._contactRepository) : super(ContactLoadingState()) {
    on<LoadContactEvent>(_onLoadContactEvent);
  }

  void _onLoadContactEvent(
    LoadContactEvent event, Emitter<ContactsState> emit) async{
      emit(ContactLoadingState());
      try{
        final users =await _contactRepository.getContacts(event.startId, event.endId);
        emit(ContactLoadedState (users));
      } catch(e){
        emit(ContactErrorState());
      }
    }
}
