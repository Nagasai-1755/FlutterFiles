
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/bloc/contacts_bloc.dart';
import 'package:watchlist_bloc/bloc/contacts_event.dart';
import 'package:watchlist_bloc/bloc/contacts_state.dart';
import 'package:watchlist_bloc/contact_repository.dart';
import 'package:watchlist_bloc/string/string_names.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage(
      {super.key, required this.startId, required this.endId});

  final int startId;
  final int endId;

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  bool isAscendingOrder = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsBloc(
        ContactRepository(),
      )..add(LoadContactEvent(widget.startId, widget.endId)),
      child: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          if (state is ContactLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ContactLoadedState) {
            final contactList = isAscendingOrder
                ? List.from(state.users)
                : List.from(state.users.reversed);

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('SORT'),
                    IconButton(
                        onPressed: () {
                          isAscendingOrder = !isAscendingOrder;
                          context.read<ContactsBloc>().add(
                              LoadContactEvent(widget.startId, widget.endId));
                        },
                        icon: Icon(isAscendingOrder
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up)),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 236, 241, 241),
                    child: ListView.builder(
                      itemCount: contactList.length,
                      itemBuilder: (context, index) {
                        final contacts = contactList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(contacts.name),
                              subtitle: Text(contacts.contact),
                              trailing: CircleAvatar(child: Image(image: NetworkImage(contacts.url))),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          if (state is ContactErrorState) {
            return const Center(
              child: Text(
                  StringNames.unexpectedError), // Display the error message.
            );
          }
          return Container();
        },
      ),
    );
  }
}
