require 'spec_helper'

describe UpdateTime do
  it 'can change the time by 0' do
    expect(UpdateTime.call('1029080014', '')).to eq '1029080014'
  end

  it 'just returns a new time if an entire timestamp is given' do
    expect(UpdateTime.call('1029080014', '1234567890')).to eq '1234567890'
  end

  xcontext 'parsing update string' do
    it 'can add a month' do
      expect(UpdateTime.call('1029080014', '1m')).to eq '1129080014'
    end

    it 'can add a day' do
      expect(UpdateTime.call('1029080014', '1d')).to eq '1030080014'
    end

    it 'can add a hour' do
      expect(UpdateTime.call('1029080014', '1y')).to eq '1029090014'
    end

    it 'can add a minute' do
      expect(UpdateTime.call('1029080014', '1M')).to eq '1029080114'
    end

    it 'can add a year' do
      expect(UpdateTime.call('1029080014', '1H')).to eq '1029080015'
    end
  end
end
