import 'package:bizzhome/models/Task.dart';

class OrderInfo {
  final int id;
  final DateTime date;
  final ClientInfo clientInfo;
  final String description;
  final List<DeliveryProcess> deliveryProcesses;
  // final Task task;
  final String task;

  OrderInfo({
    this.id,
    this.date,
    this.clientInfo,
    this.description,
    this.deliveryProcesses,
    this.task,
  });

  static List<OrderInfo> fetchAll() {
    return [
      OrderInfo(
        id: 1,
        task: "Task 2",
        date: DateTime.now(),
        clientInfo: ClientInfo(
          name: 'TestClient',
          thumbnailUrl: 'assets/images/user.jpg',
        ),
        description: "Description",
        deliveryProcesses: [
          DeliveryProcess(
            'Package Process',
            messages: [
              DeliveryMessage('8:30am', 'Package received by driver'),
              DeliveryMessage('11:30am', 'Reached halfway mark'),
            ],
          ),
          DeliveryProcess(
            'In Transit',
            messages: [
              DeliveryMessage('13:00pm', 'Driver arrived at destination'),
              DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
            ],
          ),
          DeliveryProcess.complete(),
        ],
      )
    ];
  }
}

class ClientInfo {
  final String name;
  final String thumbnailUrl;
  ClientInfo({
    this.name,
    this.thumbnailUrl,
  });
}

class DeliveryProcess {
  final String name;
  final List<DeliveryMessage> messages;

  DeliveryProcess(
    this.name, {
    this.messages = const [],
  });

  const DeliveryProcess.complete()
      : this.name = 'Done',
        this.messages = const [];

  bool get isCompleted => name == 'Done';
}

class DeliveryMessage {
  const DeliveryMessage(this.createdAt, this.message);

  final String createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}
