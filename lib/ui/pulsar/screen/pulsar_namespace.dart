import 'package:flutter/material.dart';
import 'package:paas_dashboard_flutter/generated/l10n.dart';
import 'package:paas_dashboard_flutter/route/page_route_const.dart';
import 'package:paas_dashboard_flutter/ui/util/alert_util.dart';
import 'package:paas_dashboard_flutter/ui/util/data_cell_util.dart';
import 'package:paas_dashboard_flutter/ui/util/form_util.dart';
import 'package:paas_dashboard_flutter/ui/util/spinner_util.dart';
import 'package:paas_dashboard_flutter/vm/pulsar/pulsar_namespace_view_model.dart';
import 'package:provider/provider.dart';

class PulsarNamespaceScreen extends StatefulWidget {
  PulsarNamespaceScreen();

  @override
  State<StatefulWidget> createState() {
    return new PulsarNamespaceScreenState();
  }
}

class PulsarNamespaceScreenState extends State<PulsarNamespaceScreen> {
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final vm = Provider.of<PulsarNamespaceViewModel>(context, listen: false);
    vm.fetchTopics();
    searchTextController.addListener(() {
      vm.filter(searchTextController.text);
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PulsarNamespaceViewModel>(context);
    if (vm.loading) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        SpinnerUtil.create();
      });
    }
    if (vm.loadException != null) {
      Exception ex = vm.loadException!;
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        AlertUtil.exceptionDialog(ex, context);
      });
    }
    if (vm.opException != null) {
      Exception ex = vm.opException!;
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        AlertUtil.exceptionDialog(ex, context);
      });
    }
    vm.setDataConverter((item) => DataRow(
            onSelectChanged: (bool? selected) {
              Navigator.pushNamed(context, PageRouteConst.PulsarTopic,
                  arguments: item.deepCopy());
            },
            cells: [
              DataCell(
                Text(item.topic),
              ),
              DataCellUtil.newDellDataCell(() {
                vm.deleteTopic(item.topic);
              }),
            ]));
    var topicsTable = SingleChildScrollView(
      child: PaginatedDataTable(
          showCheckboxColumn: false,
          columns: [
            DataColumn(label: Text(S.of(context).topicName)),
            DataColumn(label: Text(S.of(context).deleteTopic)),
          ],
          source: vm),
    );
    var formButton = createPartitionTopicButton(context);
    var refreshButton = TextButton(
        onPressed: () {
          vm.fetchTopics();
        },
        child: Text(S.of(context).refresh));
    var searchBox = Container(
      width: 300,
      child: TextField(
        controller: searchTextController,
      ),
    );
    var body = ListView(
      children: <Widget>[
        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [formButton, refreshButton, searchBox],
          ),
        ),
        Text(
          'Partitioned Topics',
          style: TextStyle(fontSize: 22),
        ),
        topicsTable
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Pulsar Tenant ${vm.tenant} -> Namespace ${vm.namespace}'),
      ),
      body: body,
    );
  }

  ButtonStyleButton createPartitionTopicButton(BuildContext context) {
    var list = [FormFieldDef('Topic Name'), FormFieldDef('Partition Number')];
    return FormUtil.createButton2("Partitioned Topic", list, context,
        (topic, partition) async {
      final vm = Provider.of<PulsarNamespaceViewModel>(context, listen: false);
      vm.createTopic(topic, int.parse(partition));
    });
  }
}
