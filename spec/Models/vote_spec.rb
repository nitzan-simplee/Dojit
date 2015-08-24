describe Vote do
  describe "validations" do
     
    before do
      @vote_1 = Vote.new(value: 1) 
      @vote_min1 = Vote.new((value: -1)
      @vote2 = Vote.new((value: 2)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
          expect(@vote1.valid?).to eq true  
          expect(@vote_min1.valid?).to eq true  
          expect(@vote2.valid?).to eq false  
      end
    end
  end
end