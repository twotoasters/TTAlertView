Pod::Spec.new do |s|
  s.name         = "TTAlertView"
  s.version      = "0.0.1"
  s.summary      = "TTAlertView is a drop-in replacement for UIAlertView that allows the developer to customize the presentation of an alert."
  s.homepage     = "https://github.com/twotoasters/TTAlertView"
  s.license      = 'MIT'
  s.author       = 'Two Toasters'
  s.source       = { :git => "https://github.com/aaronbrethorst/TTAlertView.git", :tag => '0.0.1' }
  s.platform     = :ios
  s.source_files = 'TTAlertView/*.{h,m}'
  s.framework  = 'QuartzCore'
  s.requires_arc = true
  s.platform     = :ios, '5.1'
  s.ios.deployment_target = '5.1'
end