describe("Roster", function() {
  var roster, jalil, irene, kelvin, myra;

  beforeEach(function() {
    // Define player objects
    jalil = new Player({
      firstName: "Jalil",
      atBats: 97,
      hits: 12,
      runs: 5
    });

    irene = new Player({
      firstName: "Irene",
      atBats: 92,
      hits: 29,
      runs: 8
    });

    kelvin = new Player({
      firstName: "Kelvin",
      atBats: 100,
      hits: 26,
      runs: 9
    });

    myra = new Player({
      firstName: "Myra",
      atBats: 99,
      hits: 17,
      runs: 6
    });

    // Assign roster
    roster = new Roster([jalil, irene, kelvin, myra]);
  });

  describe("type", function() {
    it("is a roster object", function() {
      expect(roster).toEqual(jasmine.any(Roster));
    });
  });

  describe("players", function() {
    it("has players", function() {
      expect(roster.players).toEqual([jalil, irene, kelvin, myra]);
    });
  });

  describe("finding a player by name", function() {
    it("returns a player with that first name", function() {
      expect(roster.find("Myra")).toEqual(myra);
    });
  });

  describe("identifying all star players", function() {
    it("returns the top two players based on battingAverage", function() {
      expect(roster.allStars()).toEqual(jasmine.arrayContaining([irene, kelvin]));
      expect(roster.allStars()).not.toEqual(jasmine.arrayContaining([jalil, myra]));
    });
  });
});
