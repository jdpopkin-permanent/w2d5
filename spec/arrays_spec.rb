require 'rspec'
require 'arrays.rb'

describe "#hello_world" do
  it "returns 'Hello, World!'" do
    expect(hello_world).to eq("Hello, World!")
  end
end

describe Array do

  describe "#my_uniq" do
    subject(:my_array) {[1, 2, 1, 3, 3]}
    it "mimics the results of #uniq" do
      expect(my_array.my_uniq).to eq([1,2,3])
    end
  end

  describe "#sum_two" do
    subject(:my_array) {[-1, 0, 2, -2, 1]}
    it "returns pairs of indices that sum to 0" do
      expect(my_array.sum_two).to eq([[0, 4], [2, 3]])
    end
  end
end