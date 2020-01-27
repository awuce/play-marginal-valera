require 'rspec'
require_relative '../src/marginal_do_list'
require_relative '../src/marginal_info'

describe MarginalInfo do
  describe 'stat' do
    let(:valera) { MarginalDoList.new(MarginalInfo.new(100, 0, 10, 0, 0)) }
    it 'check set params' do
      expect(valera.marginal_info.health).to eq 100
      expect(valera.marginal_info.alcohol).to eq 0
      expect(valera.marginal_info.happyness).to eq 10
      expect(valera.marginal_info.tiredness).to eq 0
      expect(valera.marginal_info.money).to eq 0
    end
  end

  describe '@health>=100' do
    let(:valera) { MarginalInfo.new(90, 0, 10, 0, 0) }
    subject { valera.health = 120 }
    it { expect { subject }.to change { valera.health }.to 100 }
  end

  describe '@health<=0' do
    let(:valera) { MarginalInfo.new(100, 0, 10, 0, 0) }
    subject { valera.health = -20 }
    it { expect { subject }.to change { valera.health }.to 0 }
  end

  describe '@alcohol>=100' do
    let(:valera) { MarginalInfo.new(100, 0, 10, 0, 0) }
    subject { valera.alcohol = 110 }
    it { expect { subject }.to change { valera.alcohol }.to 100 }
  end

  describe '@alcohol<=0' do
    let(:valera) { MarginalInfo.new(100, 5, 10, 0, 0) }
    subject { valera.alcohol = -10 }
    it { expect { subject }.to change { valera.alcohol }.to 0 }
  end

  describe '@happyness>=10' do
    let(:valera) { MarginalInfo.new(100, 0, 5, 0, 0) }
    subject { valera.happyness = 12 }
    it { expect { subject }.to change { valera.happyness }.to 10 }
  end
  describe '@happyness<=10' do
    let(:valera) { MarginalInfo.new(100, 0, 5, 0, 0) }
    subject { valera.happyness = -12 }
    it { expect { subject }.to change { valera.happyness }.to -10 }
  end

  describe '@tiredness>=100' do
    let(:valera) { MarginalInfo.new(100, 0, 10, 0, 0) }
    subject { valera.tiredness = 110 }
    it { expect { subject }.to change { valera.tiredness }.to 100 }
  end

  describe '@tiredness<=0' do
    let(:valera) { MarginalInfo.new(100, 0, 10, 5, 0) }
    subject { valera.tiredness = -1 }
    it { expect { subject }.to change { valera.tiredness }.to 0 }
  end

  describe '@money<=0' do
    let(:valera) { MarginalInfo.new(100, 0, 10, 0, 10) }
    subject { valera.money = -100 }
    it { expect { subject }.to change { valera.money }.to 0 }
  end
end
