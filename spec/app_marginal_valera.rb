require_relative '../src/app_marginal_valera'

describe "MarginalValera" do
  describe ".new" do
    before do
      @game = MarginalValera.new
    end

    context "returns a MarginalValera object" do
      it { expect(@game).to be_an_instance_of MarginalValera }
    end
    context "return a default params" do
      it { expect(@game.width).to eq 626 }
      it { expect(@game.height).to eq 378 }
    end
  end

  describe ".caption" do
    context "returns a default caption" do
      subject(:game) { MarginalValera.new }
      it { expect(game.caption).to eq "Marginal Valera" }
    end
  end

  describe ".draw" do
  end

  describe ".update" do
  end
end
