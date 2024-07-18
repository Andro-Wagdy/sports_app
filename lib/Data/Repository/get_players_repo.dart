import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/get_players_model.dart';

String player_name = "";
var team_id;
var temp;

class GetPlayersRepo {
  Future<GetPlayersModel?> getPlayers() async {
    try {
      temp = team_id;
      var playersresponse = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?&met=Players&teamId=${team_id ?? 0}&playerName=${player_name}&APIkey=ba8cce3a55c7eda219fca0330f1ac53671a427aea4542ae118bd628d6b494a67"),
      );

      var decodedResponse = jsonDecode(playersresponse.body);

      if (playersresponse.statusCode == 200) {
        GetPlayersModel myResponse = GetPlayersModel.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
