function Player(object) {
	this.firstName = object.firstName;
	this.atBats = object.atBats;
	this.hits = object.hits;
	this.runs = object.runs;
	this.battingAverage = function() {
		return (this.hits / this.atBats).toFixed(3);
	}
}


// lysette = new Player({firstName: "Lysette", atBats: 103, hits: 27, runs: 3});

// console.log(lysette);
// console.log(lysette.battingAverage());