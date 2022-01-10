import 'package:paas_dashboard_flutter/module/ssh/ssh_step.dart';
import 'package:paas_dashboard_flutter/persistent/persistent_api.dart';
import 'package:paas_dashboard_flutter/persistent/po/bk_instance_po.dart';
import 'package:paas_dashboard_flutter/persistent/po/k8s_instance_po.dart';
import 'package:paas_dashboard_flutter/persistent/po/mongo_instance_po.dart';
import 'package:paas_dashboard_flutter/persistent/po/mysql_instance_po.dart';
import 'package:paas_dashboard_flutter/persistent/po/pulsar_instance_po.dart';

class PersistentMemory implements PersistentApi {
  @override
  Future<void> savePulsar(String name, String host, int port,
      String functionHost, int functionPort) {
    // TODO: implement savePulsar
    throw UnimplementedError();
  }

  @override
  Future<void> deletePulsar(int id) {
    // TODO: implement deletePulsar
    throw UnimplementedError();
  }

  @override
  Future<List<PulsarInstancePo>> pulsarInstances() async {
    return [
      new PulsarInstancePo(0, "example", "localhost", 8080, "localhost", 8080)
    ];
  }

  @override
  Future<void> saveBookkeeper(String name, String host, int port) {
    // TODO: implement saveBookkeeper
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBookkeeper(int id) {
    // TODO: implement deleteBookkeeper
    throw UnimplementedError();
  }

  @override
  Future<List<BkInstancePo>> bookkeeperInstances() async {
    return [new BkInstancePo(0, "example", "localhost", 8080)];
  }

  @override
  Future<void> saveKubernetesSsh(String name, List<SshStep> sshSteps) {
    // TODO: implement saveKubernetesSsh
    throw UnimplementedError();
  }

  @override
  Future<void> deleteKubernetes(int id) {
    // TODO: implement deleteKubernetes
    throw UnimplementedError();
  }

  @override
  Future<List<K8sInstancePo>> kubernetesInstances() async {
    return [new K8sInstancePo(0, "example")];
  }

  @override
  Future<void> deleteMongo(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<MongoInstancePo>> mongoInstances() async {
    return [
      new MongoInstancePo(0, "example", "mongodb://localhost:27017", "", "")
    ];
  }

  @override
  Future<void> saveMongo(
      String name, String addr, String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMysql(int id) {
    // TODO: implement deleteMysql
    throw UnimplementedError();
  }

  @override
  Future<List<MysqlInstancePo>> mysqlInstances() async {
    return [
      new MysqlInstancePo(0, "example", "localhost", 3306, "hzj", "Mysql@123")
    ];
  }

  @override
  Future<void> saveMysql(
      String name, String host, int port, String username, String password) {
    // TODO: implement saveMysql
    throw UnimplementedError();
  }
}
