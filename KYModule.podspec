#
# Be sure to run `pod lib lint KYModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KYModule'
  s.version          = '0.1.0'
  s.summary          = 'modules of kelvion'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
a module repository of ky.
                       DESC

  s.homepage         = 'https://github.com/massyxf/KYModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'massyxf' => 'ssi-yanxf@dfmc.com.cn' }
  s.source           = { :git => 'https://github.com/massyxf/KYModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KYModule/Classes/**/*'
  
  s.subspec 'Base' do |b|
       b.source_files = 'KYModule/Classes/Base/**/*'
  end
  
  s.subspec 'UIKit' do |b|
      b.source_files = 'KYModule/Classes/UIKit/**/*'
      b.dependency 'KYModule/Base'
  end
  
  s.subspec 'Foundation' do |b|
       b.source_files = 'KYModule/Classes/Foundation/**/*'
       b.dependency 'KYModule/Base'
  end
  
  s.subspec 'Request' do |b|
      b.source_files = 'KYModule/Classes/Request/**/*'
      b.dependency 'KYModule/Base'
      b.dependency 'AFNetworking/NSURLSession', '~> 3.2.1'
  end
  
  s.subspec 'UIImage+UIImageView' do |b|
       b.source_files = 'KYModule/Classes/UIImage+UIImageView/**/*'
       b.dependency 'KYModule/Base'
       b.dependency 'SDWebImage', '~> 5.2.5'
  end
  
  
  
   s.resource_bundles = {
     'KYModule' => ['KYModule/Assets/**/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
