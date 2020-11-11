import 'dart:io';
import 'dart:math';
import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:emojis/emoji.dart';

// The program can cater three or more rounds and prints the score after the game.
class yourRecord {
  int wins = 0;
  int loss = 0;
  int draws = 0;

  yourRecord(this.wins, this.loss, this.draws);

  int get winCount {
    return wins;
  }

  int get lossCount {
    return loss;
  }

  int get drawsCount {
    return draws;
  }

  updateWins(int newWins) {
    wins += newWins;
  }

  updateLoss(int newLoss) {
    loss += newLoss;
  }

  updateDraws(int newDraws) {
    draws += newDraws;
  }
}

/// Get a player move via keyboard input
/// If the player does not enter a valid move
/// return "Quit" so that the main game loop
/// knows to end the game
String getPlayerMove() {
  print("Papel, Gunting, Bato! What's your Pick?");
  String selection = stdin.readLineSync().toUpperCase();

  //The program can accept values of any of the following text cases (UPPERCASE, lowercase, TitleCase)
  switch (selection.toLowerCase()) {
    //
    case "bato":
      return "Bato";
      break;
    case "papel":
      return "Papel";
      break;
    case "gunting":
      return "Gunting";
      break;

    default:
      return "Quit";
      break;
  }
}
yourRecord yourRecordNew = yourRecord(0,0,0);
/// Return a random move in the form of a string of either
/// "Rock", "Paper", or "Scissors"
String getComputerMove() {
  Random rand = new Random();
  int move = rand.nextInt(3); //random int from 0 to 2

  switch (move) {
    case 0:
      return "Bato";
      break;
    case 1:
      return "Papel";
      break;
    case 2:
      return "Gunting";
      break;
    default:
      break;
  }
}

/// Determine if the player or the computer won
/// by comparing [playerMove] to [computerMove]
String whoWon(String playerMove, String computerMove) {
  if (playerMove == computerMove) {
    //if the same, it's a tie
    yourRecordNew.updateDraws(1);
    return "Tie";
  } else if (playerMove == "Bato" && computerMove == "Gunting") {
    yourRecordNew.updateWins(1);
    return "You Win!";
  } else if (playerMove == "Gunting" && computerMove == "Papel") {
    yourRecordNew.updateWins(1);
    return "You Win!";
  } else if (playerMove == "Papel" && computerMove == "Bato") {
    yourRecordNew.updateWins(1);
    return "You Win!";
  } else {
    //if it's not a tie and you didn't win, computer won
    yourRecordNew.updateLoss(1);
    return "Computer Wins!";
  }
}

String toEmoji(selection) {
  //The program prints the results as emoji icons.
  switch (selection) {
    //
    case "Bato":
      return ('${Emojis.oncomingFist}');
      break;
    case "Papel":
      return ('${Emojis.raisedHand}');
      break;
    case "Gunting":
      return ('${Emojis.victoryHand}');
      break;
    default: //if anything but R, P, or S
      return "Quit";
      break;
  }
}




void main() {

  while (true) {
    //main game loop (qusi infinite loop)
    var currentW = yourRecordNew.winCount;
    var currentL = yourRecordNew.lossCount;
    var currentD = yourRecordNew.drawsCount;
    print(
        "Your current record is: $currentW Wins, $currentL Loss, and $currentD Draws \n");

    String playerMove = getPlayerMove();
    if (playerMove == "Quit") {
      return; //returning from void function exits it
    }

    var playerMoveEmoji = toEmoji(playerMove);
    print("You played $playerMoveEmoji");
    String computerMove = getComputerMove();

    var computerMoveEmoji = toEmoji(computerMove);
    print("Computer played $computerMoveEmoji");
    print(whoWon(playerMove, computerMove));
  }
}
