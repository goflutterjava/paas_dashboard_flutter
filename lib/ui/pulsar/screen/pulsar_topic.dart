import 'package:flutter/material.dart';
import 'package:paas_dashboard_flutter/generated/l10n.dart';
import 'package:paas_dashboard_flutter/ui/pulsar/widget/pulsar_topic_basic.dart';
import 'package:paas_dashboard_flutter/ui/pulsar/widget/pulsar_topic_produce.dart';
import 'package:paas_dashboard_flutter/ui/pulsar/widget/pulsar_topic_subscription.dart';
import 'package:paas_dashboard_flutter/vm/pulsar/pulsar_topic_basic_view_model.dart';
import 'package:paas_dashboard_flutter/vm/pulsar/pulsar_topic_produce_view_model.dart';
import 'package:paas_dashboard_flutter/vm/pulsar/pulsar_topic_subscription_view_model.dart';
import 'package:paas_dashboard_flutter/vm/pulsar/pulsar_topic_view_model.dart';
import 'package:provider/provider.dart';

class PulsarTopic extends StatefulWidget {
  PulsarTopic();

  @override
  State<StatefulWidget> createState() {
    return new _PulsarTopicState();
  }
}

class _PulsarTopicState extends State<PulsarTopic> {
  _PulsarTopicState();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PulsarTopicViewModel>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'Pulsar Topic Tenant ${vm.tenant} -> Namespace ${vm.namespace} -> Topic ${vm.topic}'),
          bottom: TabBar(
            tabs: [
              Tab(text: S.of(context).basic),
              Tab(text: S.of(context).subscription),
              Tab(text: S.of(context).produce),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChangeNotifierProvider(
              create: (context) => PulsarTopicBasicViewModel(
                  vm.pulsarInstancePo,
                  vm.tenantResp,
                  vm.namespaceResp,
                  vm.topicResp),
              child: PulsarTopicBasicWidget(),
            ).build(context),
            ChangeNotifierProvider(
              create: (context) =>
              new PulsarTopicSubscriptionViewModel(
                  vm.pulsarInstancePo,
                  vm.tenantResp,
                  vm.namespaceResp,
                  vm.topicResp),
              child: PulsarTopicSubscriptionWidget(),
            ).build(context),
            ChangeNotifierProvider(
              create: (context) => PulsarTopicProduceViewModel(
                  vm.pulsarInstancePo,
                  vm.tenantResp,
                  vm.namespaceResp,
                  vm.topicResp),
              child: PulsarTopicProduceWidget(),
            ).build(context),
          ],
        ),
      ),
    );
  }
}
