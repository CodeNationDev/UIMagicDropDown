Pod::Spec.new do |s|
  s.name             = 'UIMagicDropDown'
  s.version          = '1.0.0'
  s.summary          = 'An elegant and magic dropdown'

  s.description      = <<-DESC
  An elegant and magic dropdown for general use.
                       DESC

  s.homepage         = 'https://github.com/CodeNationDev'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = 'CodeNationDev'
  s.swift_version    = '5.0'
  s.source           = {
    :git => 'git@github.com:CodeNationDev/UIMagicDropDown.git',
    :tag => 'UIMagicDropDown-' + s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/deividmarshall'
  s.ios.deployment_target = '9.0'
  s.static_framework = true
  
  s.source_files = 'UIMagicDropDown/**/*.{swift}'
  s.resource_bundle = { 'UIMDrop' => ['UIMagicDropDown/Resources/**', 'UIMagicDropDown/Strings/**'] }
end
