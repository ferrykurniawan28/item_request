import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/colorstatus.dart';
import 'package:item_request/controllers/checkrequestcontroller.dart';

class CheckRequest extends GetView<CheckRequestController> {
  const CheckRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final List priorityStatus = ['Pending', 'Approved', 'Rejected'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request List'),
      ),
      body: StreamBuilder(
          stream: controller.streamRequests(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List data = snapshot.data.docs;
              data.sort((a, b) => priorityStatus.indexOf(a['status']).compareTo(
                  priorityStatus
                      .indexOf(b['status']))); // sort by priority status
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        controller.showdialog(
                            data[index]['username'], data[index].id);
                      },
                      child: ListTile(
                        title: Text(
                            data[index]['username'].toString().capitalize!),
                        subtitle: Text(
                            '${data[index]['item'].toString().capitalize} x ${data[index]['quantity']}'),
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
                                  color: ColorsStatus.getColor(
                                      data[index]['status']),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
