#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptester -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" && $OPPONENT != "opponent" ]]
  then
    WINNER_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT(name) DO NOTHING")
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    
    OPPONENT_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT(name) DO NOTHING")
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo "$GAME_INSERT_RESULT"
  fi
done