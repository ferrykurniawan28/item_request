import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/colorstatus.dart';
import 'package:item_request/controllers/checkstatuscontroller.dart';

class CheckStatus extends GetView<CheckStatusController> {
  const CheckStatus({super.key});

  @override
  Widget build(BuildContext context) {
    // final List priorityStatus = ['Pending', 'Approved', 'Rejected'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Approval Status'),
      ),
      body: StreamBuilder(
        stream: controller.streamUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.hasData) {
            final List data = snapshot.data.docs;
            // data.sort((a, b) => a['status'].compareTo(b['status']));
            // data.sort((a, b) => priorityStatus.indexOf(a['status']).compareTo(
            //     priorityStatus
            //         .indexOf(b['status']))); // sort by priority status
            // final data = snapshot.data.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index]['item'].toString().capitalize!),
                    subtitle: Text('${data[index]['quantity']}'),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(data[index]['status']),
                          const SizedBox(width: 10),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color:
                                  ColorsStatus.getColor(data[index]['status']),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
