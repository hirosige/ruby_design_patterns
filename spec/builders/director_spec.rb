require 'spec_helper'

describe 'Director' do
  it 'can create' do
    builder = double('WaterWithMaterilaBuilder')
    director = Director.new(builder)
    expect(director.nil?).to be false
  end

  it 'can cook' do
    builder = double('WaterWithMaterilaBuilder')
    allow(builder).to receive(:add_material)
    allow(builder).to receive(:add_water)
    director = Director.new(builder)
    director.cook

    expect(builder).to have_received(:add_material).twice
    expect(builder).to have_received(:add_water).twice
  end
end