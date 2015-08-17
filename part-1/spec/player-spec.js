describe("Player", function(){
  var player;

  beforeEach(function(){
    player = new Player({firstName: "Lysette", atBats: 103, hits: 27, runs: 3});
  });

  describe("type", function() {
    it("is a player object", function() {
      expect(player).toEqual(jasmine.any(Player));
    });
  });

  describe("firstName", function() {
    it("has a first name", function() {
      expect(player.firstName).toEqual("Lysette");
    });
  });

  describe("atBat", function(){
    it("has an atBats", function(){
      expect(player.atBats).toEqual(103);
    });
  });

  describe("hits", function(){
    it("has hits", function(){
      expect(player.hits).toEqual(27);
    });
  });

  describe("runs", function(){
    it("has runs", function(){
      expect(player.runs).toEqual(3);
    });
  });

  describe("battingAverage", function(){
    it("calculates the battingAverage", function(){
      expect(player.battingAverage()).toBeCloseTo(0.262, 2);
    });
  });

});
