require 'spec_helper'

describe 'SugarWater' do
  before(:each) do
    @sugar_water = SugarWater.new(0, 0)
  end

  it 'Can get water' do
    expect(@sugar_water.water).to eq 0
  end

  it 'Can get salt' do
    expect(@sugar_water.sugar).to eq 0
  end

  it 'can add salt' do
    expect(@sugar_water.add_material(10)).to eq 10
  end

  it 'can add water' do
    expect(@sugar_water.add_water(10)).to eq 10
  end
end