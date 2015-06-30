#
# Be sure to run `pod lib lint ZZCustomAlertView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ZZCustomAlertView"
  s.version          = "0.1.0"
  s.summary          = "ZZCustomAlertView is an alert view that you can totally customize it."
  s.description      = <<-DESC
ZZCustomAlertView is an alert view that you can totally customize it.

visit https://github.com/zzdjk6/ZZCustomAlertView for more details.
                       DESC
  s.homepage         = "https://github.com/zzdjk6/ZZCustomAlertView"
  s.screenshots     = "https://github.com/zzdjk6/ZZCustomAlertView/raw/master/ZZCustomeAlertView%20Customized.png", "https://github.com/zzdjk6/ZZCustomAlertView/raw/master/ZZCustomAlertView%20Plain.png"
  s.license          = 'MIT'
  s.author           = { "zzdjk6" => "zzdjk6@126.com" }
  s.source           = { :git => "https://github.com/zzdjk6/ZZCustomAlertView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ZZCustomAlertView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
