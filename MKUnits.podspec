
Pod::Spec.new do |s|
  s.name             = 'MKUnits'
  s.version          = '4.0.0'
  s.summary          = 'Unit conversion library for Swift. It provides units of measurement of physical quantities and simplifies manipulation of them.'

  s.homepage         = 'https://github.com/michalkonturek/MKUnits'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michal Konturek' => 'michal.konturek@gmail.com' }
  s.source           = { :git => 'https://github.com/michalkonturek/MKUnits.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/michalkonturek'

  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '2.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'MKUnits/Classes/**/*'
end
