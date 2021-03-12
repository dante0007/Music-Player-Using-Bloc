import 'package:music_player/Model/tracklistmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Repositry{

 final baseurl1 = 'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d78bc7a52a41ba2fc1ef05b9cf40d7'; 

 List<Tracklist> _parsetrack(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Tracklist>((json) => Tracklist.fromJson(json)).toList();
  }

  Future<List<Tracklist>> fetchtracklist() async {
   final response = await http.get(baseurl1);
   var tracklist = [];
   if(response.statusCode == 200){
     tracklist = _parsetrack(response.body);
   } 
   return tracklist;
  }
}