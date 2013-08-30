require "rspec"
require "towers_of_hanoi.rb"

describe TowersOfHanoi do
  describe "#render" do
    subject(:tower) { TowersOfHanoi.new(3) }
    it "renders the tower" do
      expect(tower.render).to eq("Tower 1: [3, 2, 1]\nTower 2: []\nTower 3: []\n")
    end
  end

  describe "#move" do
    subject(:tower) { TowersOfHanoi.new(3) }
    it "raises error when moving from an empty tower" do
      expect { tower.move(3,1) }.to raise_error
    end

    it "raises error if given arguments over 3" do
      expect { tower.move(4,1) }.to raise_error
    end

    it "moves disks from tower 1 to tower 3" do
      expect(tower.move(1,3).towers).to eq([[3,2],[],[1]])
    end

    it "moves disks from tower 1 to tower 3 and back" do
      expect(tower.move(1,3).move(3,1).towers).to eq([[3,2,1],[],[]])
    end

    #need to try move big on top of small
    it "does not allow moving a larger piece onto a smaller one" do
      tower.move(1, 2)
      expect { tower.move(1, 2) }.to raise_error
    end
  end

  describe "#won?" do
    subject(:tower) { TowersOfHanoi.new(3) }
    it "does not think you won in the start config" do
      expect(tower.won?).to eq(false)#[3,2,1], [], []
    end

    it "does not think you won during the game" do
      tower.move(1, 3)
      expect(tower.won?).to eq(false)# [3,2], [], [1]
    end

    it "does think you won in the win state middle tower" do
      tower.move(1, 2)
      tower.move(1, 3)
      tower.move(2, 3)
      tower.move(1, 2)
      tower.move(3, 1)
      tower.move(3, 2)
      tower.move(1, 2)
      expect(tower.won?).to eq(true)#[], [1,2,3], []
    end





  end

end












