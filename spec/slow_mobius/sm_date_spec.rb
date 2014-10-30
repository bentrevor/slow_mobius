require 'spec_helper'

describe SlowMobius::SMDate do
  let(:date) { described_class.new('1029080014') }

  it 'can add months' do
    date.add_months(1)
    expect(date.to_timestamp).to eq '1129080014'
  end

  it 'can add days' do
    date.add_days(1)
    expect(date.to_timestamp).to eq '1030080014'
  end

  it 'understands calendars' do
    date.add_days(5) # Oct 34 => Nov 3
    expect(date.to_timestamp).to eq '1103080014'
  end

  it 'can add minutes' do
    date.add_minutes(19)
    expect(date.to_timestamp).to eq '1029081914'
  end
end
