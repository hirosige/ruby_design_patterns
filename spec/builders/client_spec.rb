require 'spec_helper'

describe 'Client' do
  it 'can use' do
    builder = WaterWithMaterialBuilder.new(SaltWater.new(0, 0))
    director = Director.new(builder)
    director.cook

    material = builder.result

    expect(material.water).to eq 450
    expect(material.salt).to eq 125

    builder = WaterWithMaterialBuilder.new(SugarWater.new(0, 0))
    director = Director.new(builder)
    director.cook

    material = builder.result

    expect(material.water).to eq 450
    expect(material.sugar).to eq 125
  end
end