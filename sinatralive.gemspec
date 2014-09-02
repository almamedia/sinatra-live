Gem::Specification.new do |s|
  s.name        = 'sinatralive'
  s.version     = '0.1.0'
  s.summary     = "Puma reloader for Sinatra-apps."
  s.description = "Watches for changes in your Sinatra-app and reloads Puma daemon with the new app code."
  s.authors     = ["Kai Kousa"]
  s.email       = 'kai.kousa@almamedia.fi'
  s.files       = Dir["lib/**/*.*", "*.md", "bin/*"]
  s.executables << 'sinatra-live'
  s.homepage    = 'https://github.com/almamedia/sinatra-live'

  s.add_runtime_dependency 'filewatcher'
  s.add_runtime_dependency 'colorize'
  s.add_runtime_dependency 'clamp'
end
