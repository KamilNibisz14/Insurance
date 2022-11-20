import 'package:cloud_firestore/cloud_firestore.dart';

class GetPolicyID{
  final CollectionReference<Map<String, dynamic>> list = FirebaseFirestore.instance.collection('policy');
  Future<String> getPolicyID()async{
    AggregateQuerySnapshot query = await list.count().get();
    String count = (query.count + 1).toString();
    String policyNumber = '9085700000000';
    String policyID = policyNumber.substring(0,policyNumber.length - count.length) + count;
    return policyID;
  }

}