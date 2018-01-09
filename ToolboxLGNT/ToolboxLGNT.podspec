#
# Be sure to run `pod lib lint ToolboxLGNT.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ToolboxLGNT'
  s.version          = '0.1.0'
  s.summary          = 'A personnal toolbox to have all my generic codes in one place.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ToolboxLGNT is a personnal toolbox.
I begin it in order to keep track and have all my generics code in one place.
Also, it can (and will) contains code that are maybe very differents, and you may only need some component of it and that why the source code is available on github.
                       DESC

  s.homepage         = 'https://github.com/amoriarty/ToolboxLGNT'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'GPL-3.0', :file => 'LICENSE' }
  s.author           = { 'amoriarty' => 'alexandrelegent@gmail.com' }
  s.source           = { :git => 'https://github.com/amoriarty/ToolboxLGNT.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'ToolboxLGNT/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ToolboxLGNT' => ['ToolboxLGNT/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
