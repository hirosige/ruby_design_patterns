Dir[File.expand_path('../../../builders', __FILE__) << '/*.rb'].each do |file|
  require file
end

Dir[File.expand_path('../../../proxies', __FILE__) << '/*.rb'].each do |file|
  require file
end

Dir[File.expand_path('../../../commands', __FILE__) << '/*.rb'].each do |file|
  require file
end

Dir[File.expand_path('../../../decorators', __FILE__) << '/*.rb'].each do |file|
  require file
end