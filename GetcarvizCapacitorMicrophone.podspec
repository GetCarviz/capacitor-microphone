require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = 'GetcarvizCapacitorMicrophone'
  s.version = package['version']
  s.summary = package['description']
  s.license = package['license']
  s.homepage = 'https://github.com/GetCarviz/capacitor-microphone'
  s.author = package['author']
  s.source = { :git => 'https://github.com/GetCarviz/capacitor-microphone.git', :tag => s.version.to_s }
  s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.ios.deployment_target = '17.0'
  s.dependency 'Capacitor'
  s.swift_version = '5.1'
end
