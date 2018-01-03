def load_pattern name
  Dir[File.expand_path("../../../#{name}", __FILE__) << '/*.rb'].each do |file|
    require file
  end
end

DESIGN_PATTERNS = %w(
  builders
  proxies
  commands
  decorators
  observers
)

DESIGN_PATTERNS.each do |pattern|
  load_pattern pattern
end
