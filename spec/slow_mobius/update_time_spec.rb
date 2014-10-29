require 'spec_helper'

describe UpdateTime do
  it 'can change the time by 0' do
    expect(UpdateTime.call('1029080014', '')).to eq '1029080014'
  end
end
