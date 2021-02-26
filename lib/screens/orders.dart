import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:bizzhome/models/Order.dart';

const kTileHeight = 50.0;

class OrdersPage extends StatelessWidget {
  final tasks = OrderInfo.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.black,
        brightness: Brightness.light,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => _itemBuilder(context, tasks[index]),
        ),
      ),
    );
  }
}

Widget _itemBuilder(BuildContext context, task) {
  return Center(
    child: Container(
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _OrderTitle(
                orderInfo: task,
              ),
            ),
            Divider(height: 1.0),
            _DeliveryProcesses(processes: task.deliveryProcesses),
            Divider(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _OnTimeBar(client: task.clientInfo),
            ),
          ],
        ),
      ),
    ),
  );
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key key,
    @required this.orderInfo,
  })  : assert(orderInfo != null),
        super(key: key);

  final OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Delivery #${orderInfo.id} for ${orderInfo.task}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Spacer(),
        Text(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          style: TextStyle(
            color: Color(0xffb6b2b2),
          ),
        ),
      ],
    );
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    @required this.messages,
  });

  final List<DeliveryMessage> messages;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                thickness: 1.0,
              ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                size: 10.0,
                position: 0.5,
              ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
              !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            return Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(messages[index - 1].toString()),
            );
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 30.0,
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key key, @required this.processes})
      : assert(processes != null),
        super(key: key);

  final List<DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xff989898),
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      processes[index].name,
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: 18.0, color: Colors.white),
                    ),
                    _InnerTimeline(messages: processes[index].messages),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return DotIndicator(
                  color: Color(0xFFE5634D),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.0,
                  ),
                );
              } else {
                return OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: processes[index].isCompleted ? Color(0xFFE5634D) : null,
            ),
          ),
        ),
      ),
    );
  }
}

class _OnTimeBar extends StatelessWidget {
  const _OnTimeBar({Key key, @required this.client})
      : assert(client != null),
        super(key: key);

  final ClientInfo client;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(
          builder: (context) => MaterialButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('On-time!'),
                ),
              );
            },
            elevation: 0,
            shape: StadiumBorder(),
            color: Color(0xFFE5634D),
            textColor: Colors.white,
            child: Text('On-time'),
          ),
        ),
        Spacer(),
        Text('Client\n${client.name}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            )),
        SizedBox(width: 12.0),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(
                client.thumbnailUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
