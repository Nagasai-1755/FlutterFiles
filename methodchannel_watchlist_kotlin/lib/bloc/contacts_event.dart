abstract class ContactsEvent{}

class LoadContactEvent extends ContactsEvent{
  final int startId;
  final int endId;

  LoadContactEvent(this.startId, this.endId);
}