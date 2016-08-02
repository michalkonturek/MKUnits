
Pod::Spec.new do |s|
  s.name             = 'MKUnits'
  s.version          = '3.0.0'
  s.summary          = 'Unit conversion library for Swift. It provides units of measurement of physical quantities and simplifies manipulation of them.'
  s.description      = <<-DESC
  Extendable unit conversion and manipulation library which supports many unit types.
  Beyond basic conversion functionality the features of MKUnits include:
  – The ability to easily add/subtract between different unit measurements
  – Easy conversion of different unit sizes to another
  – High precision, and the ability toround off results
  – Support for many unit types for area, bytes, mass, length and time
  – Easy unit type additions by extending the MKUnit class
                       DESC

  s.homepage         = 'https://github.com/michalkonturek/MKUnits'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michal Konturek' => 'michal.konturek@gmail.com' }
  s.source           = { :git => 'https://github.com/michalkonturek/MKUnits.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/michalkonturek'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MKUnits/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MKUnits' => ['MKUnits/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
