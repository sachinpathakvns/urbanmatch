import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model.dart';
import 'modelcomit.dart';

class ServiceProvider{
  Future<List<Urbanmatch>?> getdoctor()async{
    var client = http.Client();

    var uri = Uri.parse('https://api.github.com/users/freeCodeCamp/repos#');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      List<Urbanmatch> getData = [];
      getData.addAll(List<Urbanmatch>.from(json.decode(response.body).map((x) => Urbanmatch.fromJson(x))));
      return getData;
    }
  }

  Future<List<Urbanmatchcommit>?> getcommit()async{
    var client = http.Client();

    var uri = Uri.parse('https://api.github.com/repos/freeCodeCamp/1Aug2015GameDev/commits#');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      List<Urbanmatchcommit> getData = [];
      getData.addAll(List<Urbanmatchcommit>.from(json.decode(response.body).map((x) => Urbanmatchcommit.fromJson(x))));
      return getData;
    }
  }
}