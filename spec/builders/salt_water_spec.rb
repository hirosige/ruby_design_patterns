require 'spec_helper'

describe 'SaltWater' do
  before(:each) do
    @salt_water = SaltWater.new(0, 0)
  end

  it 'Can get water' do
    expect(@salt_water.water).to eq 0
  end

  it 'Can get salt' do
    expect(@salt_water.salt).to eq 0
  end

  it 'can add salt' do
    expect(@salt_water.add_material(10)).to eq 10
  end

  it 'can add water' do
    expect(@salt_water.add_water(10)).to eq 10
  end
end