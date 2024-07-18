class GetPlayersModel {
  GetPlayersModel({
    required this.success,
    required this.result,
  });
  late final int success;
  late final List<Result> result;

  GetPlayersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['result'] = result.map((e) => e.toJson()).toList();
    return data;
  }
}

class Result {
  Result({
    required this.playerKey,
    required this.playerName,
    this.playerNumber,
    this.playerCountry,
    required this.playerType,
    this.playerAge,
    this.playerMatchPlayed,
    this.playerGoals,
    this.playerYellowCards,
    this.playerRedCards,
    this.playerMinutes,
    required this.playerInjured,
    this.playerSubstituteOut,
    this.playerSubstitutesOnBench,
    this.playerAssists,
    required this.playerIsCaptain,
    this.playerShotsTotal,
    this.playerGoalsConceded,
    this.playerFoulsCommited,
    this.playerTackles,
    this.playerBlocks,
    this.playerCrossesTotal,
    this.playerInterceptions,
    this.playerClearances,
    this.playerDispossesed,
    this.playerSaves,
    this.playerInsideBoxSaves,
    this.playerDuelsTotal,
    this.playerDuelsWon,
    this.playerDribbleAttempts,
    this.playerDribbleSucc,
    this.playerPenComm,
    this.playerPenWon,
    this.playerPenScored,
    this.playerPenMissed,
    this.playerPasses,
    this.playerPassesAccuracy,
    this.playerKeyPasses,
    this.playerWoordworks,
    this.playerRating,
    required this.teamName,
    required this.teamKey,
    this.playerImage,
  });
  late final int playerKey;
  late final String playerName;
  late final playerNumber;
  late final playerCountry;
  late final String playerType;
  late final playerAge;
  late final playerMatchPlayed;
  late final playerGoals;
  late final playerYellowCards;
  late final playerRedCards;
  late final playerMinutes;
  late final String playerInjured;
  late final playerSubstituteOut;
  late final playerSubstitutesOnBench;
  late final playerAssists;
  late final String playerIsCaptain;
  late final playerShotsTotal;
  late final playerGoalsConceded;
  late final playerFoulsCommited;
  late final playerTackles;
  late final playerBlocks;
  late final playerCrossesTotal;
  late final playerInterceptions;
  late final playerClearances;
  late final playerDispossesed;
  late final playerSaves;
  late final playerInsideBoxSaves;
  late final playerDuelsTotal;
  late final playerDuelsWon;
  late final playerDribbleAttempts;
  late final playerDribbleSucc;
  late final playerPenComm;
  late final playerPenWon;
  late final playerPenScored;
  late final playerPenMissed;
  late final playerPasses;
  late final playerPassesAccuracy;
  late final playerKeyPasses;
  late final playerWoordworks;
  late final playerRating;
  late final String teamName;
  late final int teamKey;
  late final playerImage;

  Result.fromJson(Map<String, dynamic> json) {
    playerKey = json['player_key'];
    playerName = json['player_name'];
    playerNumber = json['player_number'];
    playerCountry = json['player_country'];
    playerType = json['player_type'];
    playerAge = json['player_age'];
    playerMatchPlayed = json['player_match_played'];
    playerGoals = json['player_goals'];
    playerYellowCards = json['player_yellow_cards'];
    playerRedCards = json['player_red_cards'];
    playerMinutes = json['player_minutes'];
    playerInjured = json['player_injured'];
    playerSubstituteOut = json['player_substitute_out'];
    playerSubstitutesOnBench = json['player_substitutes_on_bench'];
    playerAssists = json['player_assists'];
    playerIsCaptain = json['player_is_captain'];
    playerShotsTotal = json['player_shots_total'];
    playerGoalsConceded = json['player_goals_conceded'];
    playerFoulsCommited = json['player_fouls_commited'];
    playerTackles = json['player_tackles'];
    playerBlocks = json['player_blocks'];
    playerCrossesTotal = json['player_crosses_total'];
    playerInterceptions = json['player_interceptions'];
    playerClearances = json['player_clearances'];
    playerDispossesed = json['player_dispossesed'];
    playerSaves = json['player_saves'];
    playerInsideBoxSaves = json['player_inside_box_saves'];
    playerDuelsTotal = json['player_duels_total'];
    playerDuelsWon = json['player_duels_won'];
    playerDribbleAttempts = json['player_dribble_attempts'];
    playerDribbleSucc = json['player_dribble_succ'];
    playerPenComm = json['player_pen_comm'];
    playerPenWon = json['player_pen_won'];
    playerPenScored = json['player_pen_scored'];
    playerPenMissed = json['player_pen_missed'];
    playerPasses = json['player_passes'];
    playerPassesAccuracy = json['player_passes_accuracy'];
    playerKeyPasses = json['player_key_passes'];
    playerWoordworks = json['player_woordworks'];
    playerRating = json['player_rating'];
    teamName = json['team_name'];
    teamKey = json['team_key'];
    playerImage = json['player_image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['player_key'] = playerKey;
    data['player_name'] = playerName;
    data['player_number'] = playerNumber;
    data['player_country'] = playerCountry;
    data['player_type'] = playerType;
    data['player_age'] = playerAge;
    data['player_match_played'] = playerMatchPlayed;
    data['player_goals'] = playerGoals;
    data['player_yellow_cards'] = playerYellowCards;
    data['player_red_cards'] = playerRedCards;
    data['player_minutes'] = playerMinutes;
    data['player_injured'] = playerInjured;
    data['player_substitute_out'] = playerSubstituteOut;
    data['player_substitutes_on_bench'] = playerSubstitutesOnBench;
    data['player_assists'] = playerAssists;
    data['player_is_captain'] = playerIsCaptain;
    data['player_shots_total'] = playerShotsTotal;
    data['player_goals_conceded'] = playerGoalsConceded;
    data['player_fouls_commited'] = playerFoulsCommited;
    data['player_tackles'] = playerTackles;
    data['player_blocks'] = playerBlocks;
    data['player_crosses_total'] = playerCrossesTotal;
    data['player_interceptions'] = playerInterceptions;
    data['player_clearances'] = playerClearances;
    data['player_dispossesed'] = playerDispossesed;
    data['player_saves'] = playerSaves;
    data['player_inside_box_saves'] = playerInsideBoxSaves;
    data['player_duels_total'] = playerDuelsTotal;
    data['player_duels_won'] = playerDuelsWon;
    data['player_dribble_attempts'] = playerDribbleAttempts;
    data['player_dribble_succ'] = playerDribbleSucc;
    data['player_pen_comm'] = playerPenComm;
    data['player_pen_won'] = playerPenWon;
    data['player_pen_scored'] = playerPenScored;
    data['player_pen_missed'] = playerPenMissed;
    data['player_passes'] = playerPasses;
    data['player_passes_accuracy'] = playerPassesAccuracy;
    data['player_key_passes'] = playerKeyPasses;
    data['player_woordworks'] = playerWoordworks;
    data['player_rating'] = playerRating;
    data['team_name'] = teamName;
    data['team_key'] = teamKey;
    data['player_image'] = playerImage;
    return data;
  }
}
