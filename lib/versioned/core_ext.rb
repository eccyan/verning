Dir["#{File.dirname(__FILE__)}/core_ext/*.rb"].sort.each do |path|
  next if File.basename(path, '.rb') == 'logger'
  require "versioned/core_ext/#{File.basename(path, '.rb')}"
end
