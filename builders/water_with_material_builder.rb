class WaterWithMaterialBuilder
  def initialize(material)
    @material = material
  end

  def add_material(amount)
    @material.add_material(amount)
  end

  def add_water(amount)
    @material.add_water(amount)
  end

  def result
    @material
  end
end