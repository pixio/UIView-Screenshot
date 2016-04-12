Pod::Spec.new do |s|
  s.name             = "UIView-Screenshot"
  s.version          = "0.1.2"
  s.summary          = "Let's you screenshot views."
  s.description      = <<-DESC
                       Use the instance method -screenshot on any view or the UIView class method screenshotWholeWindow to screenshot the entire window.
                       DESC
  s.homepage         = "https://github.com/pixio/UIView-Screenshot/"
  s.license          = 'MIT'
  s.author           = { "Daniel Blakemore" => "DanBlakemore@gmail.com" }
  s.source = {
   :git => "https://github.com/pixio/UIView-Screenshot.git",
   :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
