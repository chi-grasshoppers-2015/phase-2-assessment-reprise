function Roster(arrayOfPlayers) {
	this.players = arrayOfPlayers;
	this.find = function(playerName) {
		for (var i = 0; i < this.players.length; i++) {
			if (this.players[i].firstName === playerName) {
				return this.players[i];
			}
		}
	}
	this.allStars = function() {
		var sortedByAverage = this.players.sort(function(a,b) {
			return b.battingAverage() - a.battingAverage()
		});
		return [sortedByAverage[0],sortedByAverage[1]];
	}
}


//////////// other initial attempts to write Roster.allStars ////////////

	// this.allStars = function() {
	// 	var highestSoFar = "";
	// 	var secondHighestSoFar = "";
	// 	for (var i = 0; i < this.players.length; i++) {
	// 		if (this.players[i].battingAverage > highestSoFar.battingAverage) {
	// 			highestSoFar = this.players[i];
	// 		}
	// 		else if (this.players[i].battingAverage > secondHighestSoFar.battingAverage) {
	// 			secondHighestSoFar = this.players[i];
	// 		}
	// 	}

	// 	return [highestSoFar, secondHighestSoFar]
	// }

	// this.allStars = function() {
	// 	var sortedByAverage = this.players.sort(function(player) {
	// 		return player.hits;
	// 	})
	// 	console.log(sortedByAverage);
	// 	// var highestTwoAvgs = sorted
	// }


	// this.allStars = function() {
	// 	var tempArr = [];
	// 	for (var i = 0; i < this.players.length; i++) {
	// 		if (tempArr.length < 2) {
	// 			tempArr.push(this.players[i]);
	// 			tempArr.sort();
	// 		}
	// 		else {
	// 			if (tempArr[1] < this.players[i])
	// 				tempArr.splice(tempArr.length-1,1) // delete last item in tempArr
	// 				if (tempArr[0] < this.players[i]) {
	// 					tempArr.unshift(this.players[i])
	// 				}
	// 				else {
	// 					tempArr.push(this.players[i]);
	// 				}
	// 		}
	// 		return tempArr;
	// 	}
	// }

