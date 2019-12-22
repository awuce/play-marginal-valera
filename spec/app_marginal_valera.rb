require_relative '../src/app_marginal_valera'

describe "MarginalValera" do
  describe ".new" do
    context "returns a MarginalValera object" do
      it { expect(MarginalValera.new).to be_an_instance_of MarginalValera }
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
