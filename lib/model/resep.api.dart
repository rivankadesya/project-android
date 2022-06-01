import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/resep.dart';

class ResepApi {


  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com','/recipes/list',{
      "from": "0",
      "size": "30",
      "tags": "under_30_minutes"
    });

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "X-RapidAPI-Key": "d0fc7652e9msh100e32435965e88p1b8dc7jsnb1533faf6449",
      "useQueryString": "true"
    });
    
    Map data = jsonDecode(response.body);
    List _temp = [];
    for(var i in data['results']){
      _temp.add(i);
    }
    return Resep.resepFromSnapshot(_temp);

  }

}