Pod::Spec.new do |s|
  s.name             = 'Preacher'
  s.version          = '0.1.0'
  s.license          = 'MIT'
  s.summary          = 'Easy Predicates in Swift'
  s.homepage         = 'https://github.com/ahernandezlopez/Preacher'
  s.social_media_url = 'https://twitter.com/ahernandezlopez'
  s.authors          = { 'Albert Hernández López' => 'albert.hernandez@gmail.com' }
  s.source           = { :git => 'https://github.com/ahernandezlopez/Preacher.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'Preacher/**/*.swift'
  
  s.requires_arc = true
end