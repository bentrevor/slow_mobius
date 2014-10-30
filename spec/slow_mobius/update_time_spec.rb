require 'spec_helper'

describe SlowMobius::UpdateTime do
  it 'can change the time by 0' do
    expect(described_class.call('1029080014', '')).to eq '1029080014'
  end

  it 'just returns a new time if an entire timestamp is given' do
    expect(described_class.call('1029080014', '1234567890')).to eq '1234567890'
  end

  context 'parsing update string' do
    it 'can add a month' do
      expect(described_class.call('1029080014', '1m')).to eq '1129080014'
    end

    it 'can add a day' do
      expect(described_class.call('1029080014', '1d')).to eq '1030080014'
    end

    it 'can add a hour' do
      expect(described_class.call('1029080014', '1H')).to eq '1029090014'
    end

    it 'can add a minute' do
      expect(described_class.call('1029080014', '1M')).to eq '1029080114'
    end

    it 'can add a year' do
      expect(described_class.call('1029080014', '1y')).to eq '1029080015'
    end

    it 'can handle many digits' do
      expect(described_class.call('1029080014', '45M')).to eq '1029084514'
    end

    it 'can handle comma separated updates' do
      expect(described_class.call('1029080014', '1m,1d,1H,1M,1y')).to eq '1130090115'
    end
  end
end
