require 'tdd'

describe Array do
  describe "#uniq" do
    context 'removes duplicate elements' do
      it 'returns array with elements appearing once each' do
        expect( [1,2,1,3,3].uniq ).to eq( [1,2,3] )
      end
    end
  
    context 'order unchanged' do
      it 'elements appear in order in which they appear in the original array' do
        expect([1,2,5,2,3,5].uniq).to eq([1,2,5,3])
      end
    end
  end
   
  describe "#two_sum" do 
    context "array of indices' pairs" do
      it "returns array of index pairs" do
        expect([-1, 0, 2, -2, 1].two_sum.all?{|ele| ele.is_a?(Array)}).to eq(true)
      end
    end
    context "smaller index first" do
      it "the smaller index comes first in the pair" do 
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
      end
    end
  end
end


describe "my_transpose" do
  context "returns a 2D array" do
    it "checks if every element in the output is an array" do
      expect(
        my_transpose(
          [[0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]])
            .all? {|el| el.is_a?(Array)}).to eq(true)
    end
  end

  context "returns a 2D array" do
    it "checks if every element in the output is an array" do
      expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7],[2, 5, 8]])
    end
  end
end


describe "stock_pick" do
  context "returns array" do
    it "returns an array" do
      expect(stock_pick([2,7,5,1]).is_a?(Array)).to eq (true)
    end
  end

  context "buy low sell high" do
    it "returns a pair of indices that give the max profit" do
      expect(stock_pick([2,7,5,1])).to eq([0,1])
    end 
  end

  context "buy low sell high" do
    it "can't sell before you buy" do
      expect(stock_pick([2,7,3,1,7])).to eq([3,4])
    end 
  end

end
