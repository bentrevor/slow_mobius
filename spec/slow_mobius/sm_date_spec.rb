require 'spec_helper'

describe SlowMobius::SMDate do
  let(:date) { described_class.new('1029080014') }

  it 'parses a timestamp' do
    expect(date.month).to  eq 10
    expect(date.day).to    eq 29
    expect(date.hour).to   eq 8
    expect(date.minute).to eq 0
    expect(date.year).to   eq 14
  end

  it 'can encode itself as a timestamp' do
    date        = described_class.new ''
    date.month  = 10
    date.day    = 29
    date.hour   = 8
    date.minute = 0
    date.year   = 14

    expect(date.to_timestamp).to eq '1029080014'
  end
end
