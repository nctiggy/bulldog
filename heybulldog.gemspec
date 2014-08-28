Gem::Specification.new do |s|
  s.name        = 'heybulldog'
  s.version     = '0.0.1'
  s.date        = '2014-08-27'
  s.summary     = "A Ruby Library for EMC's XtremIO"
  s.description = "Abstraction of the XtremIO API"
  s.authors     = ["Craig J Smith"]
  s.email       = 'nctiggy@gmail.com'
  s.require_paths = %w[lib]
  s.files       = ["lib/heybulldog.rb"]
  s.homepage    =
    'https://github.com/nctiggy/bulldog'
  s.license       = 'MIT'
  s.add_runtime_dependency "json",
    ["~> 1.8"]
  s.add_runtime_dependency "rest-client",
    ["= 1.7.2"]
end