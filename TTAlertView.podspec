Pod::Spec.new do |s|
  s.name         = "TTAlertView"
  s.version      = "0.0.5"
  s.summary      = "TTAlertView is a drop-in replacement for UIAlertView that allows the developer to customize the presentation of an alert."
  s.homepage     = "https://github.com/twotoasters/TTAlertView"
  s.license      = 'MIT'
  s.author       = 'Two Toasters'
  s.source       = { :git => "https://github.com/twotoasters/TTAlertView.git", :tag => '0.0.5' }
  s.platform     = :ios
  s.source_files = 'TTAlertView/*.{h,m}'
  s.framework  = 'QuartzCore'
  s.requires_arc = true
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
end