require 'spec_helper'

describe 'WaterWithMaterialBuilder' do
  it 'Can create material with salt' do
    salt_water = double("SaltWater")
    builder = WaterWithMaterialBuilder.new(salt_water)
    expect(builder.nil?).not_to eq true
  end

  it 'Can create material with salt' do
    salt_water = double("SugarWater")
    builder = WaterWithMaterialBuilder.new(salt_water)
    expect(builder.nil?).not_to eq true
  end

  it 'Can add material' do
    salt_water = double("SugarWater")
    allow(salt_water).to receive(:add_material)

    builder = WaterWithMaterialBuilder.new(salt_water)
    builder.add_material(10)

    expect(salt_water).to have_received(:add_material).once
  end

  it 'Can add water' do
    salt_water = double("SugarWater")
    allow(salt_water).to receive(:add_water)

    builder = WaterWithMaterialBuilder.new(salt_water)
    builder.add_water(10)

    expect(salt_water).to have_received(:add_water).once
  end

  it 'can get result' do
    salt_water = double("SugarWater")

    builder = WaterWithMaterialBuilder.new(salt_water)
    allow(builder).to receive(:result).and_return(salt_water)

    expect(builder.result).to eq salt_water
  end
end