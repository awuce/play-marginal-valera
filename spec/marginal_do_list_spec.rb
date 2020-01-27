require 'rspec'
require_relative '../src/marginal_do_list'
require_relative '../src/marginal_info'

describe MarginalDoList do
  describe '#go_to_work' do
    let(:valera) { MarginalDoList.new(MarginalInfo.new(100, 0, 10, 0, 0)) }
    before { valera.go_to_work }
    it 'check params after go_to_work' do
      expect(valera.marginal_info.health).to eq 100
      expect(valera.marginal_info.alcohol).to eq 0
      expect(valera.marginal_info.happyness).to eq 5
      expect(valera.marginal_info.tiredness).to eq 70
      expect(valera.marginal_info.money).to eq 100
    end
  end

  describe '#contemplate_nature' do
    let(:valera) { MarginalDoList.new(MarginalInfo.new(100, 100, 0, 50, 0)) }
    before { valera.contemplate_nature }
    it 'check params after contemplate_nature' do
      expect(valera.marginal_info.health).to eq 100
      expect(valera.marginal_info.alcohol).to eq 90
      expect(valera.marginal_info.happyness).to eq 1
      expect(valera.marginal_info.tiredness).to eq 40
      expect(valera.marginal_info.money).to eq 0
    end
  end

  describe '#drink_wine_and_watch_series' do
    let(:valera) { MarginalDoList.new(MarginalInfo.new(100, 0, 0, 0, 100)) }
    before { valera.drink_wine_and_watch_series }
    it 'check params after drink_wine_and_watch_series' do
      expect(valera.marginal_info.health).to eq 95
      expect(valera.marginal_info.alcohol).to eq 30
      expect(valera.marginal_info.happyness).to eq -1
      expect(valera.marginal_info.tiredness).to eq 10
      expect(valera.marginal_info.money).to eq 80
    end
  end

  describe '#go_to_the_bar' do
    let(:valera) { MarginalDoList.new(MarginalInfo.new(100, 0, 0, 0, 100)) }
    before { valera.go_to_the_bar }
    it 'check params after go_to_the_bar' do
      expect(valera.marginal_info.health).to eq 90
      expect(valera.marginal_info.alcohol).to eq 60
      expect(valera.marginal_info.happyness).to eq 1
      expect(valera.marginal_info.tiredness).to eq 40
      expect(valera.marginal_info.money).to eq 0
    end
  end

  describe '#marginaling' do
    let(:valera) { MarginalDoList.new(MarginalInfo.new(100, 0, 0, 0, 150)) }
    before { valera.marginaling }
    it 'check params after marginaling' do
      expect(valera.marginal_info.health).to eq 20
      expect(valera.marginal_info.alcohol).to eq 90
      expect(valera.marginal_info.happyness).to eq 5
      expect(valera.marginal_info.tiredness).to eq 80
      expect(valera.marginal_info.money).to eq 0
    end
  end

  describe '#sing_in_the_subway' do
    let(:valera) { MarginalDoList.new(MarginalInfo.new(100, 50, 0, 0, 0)) }
    before { valera.sing_in_the_subway }
    it 'check params after sing_in_the_subway' do
      expect(valera.marginal_info.health).to eq 100
      expect(valera.marginal_info.alcohol).to eq 60
      expect(valera.marginal_info.happyness).to eq 1
      expect(valera.marginal_info.tiredness).to eq 20
      expect(valera.marginal_info.money).to eq 60
    end
  end

  describe '#sleeping' do
    let(:valera) { MarginalDoList.new(MarginalInfo.new(10, 20, 0, 100, 0)) }
    before { valera.sleeping }
    it 'check params after sleeping' do
      expect(valera.marginal_info.health).to eq 100
      expect(valera.marginal_info.alcohol).to eq 0
      expect(valera.marginal_info.happyness).to eq 0
      expect(valera.marginal_info.tiredness).to eq 30
      expect(valera.marginal_info.money).to eq 0
    end
  end
end
