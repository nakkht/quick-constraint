Pod::Spec.new do |spec|

  spec.name = "QuickConstraint"
  spec.version = "0.1.0"
  spec.summary = "Short and fast auto layout done programmatically. Only syntactic suger."

  spec.homepage = "https://github.com/nakkht/quick-constraint"
  spec.license = { :type => "Apache v2.0", :file => "LICENSE" }

  spec.author = { "Paulius Gudonis" => "pg@neqsoft.com" }
  spec.social_media_url = "https://twitter.com/nakkht"

  spec.platform = :ios
  spec.ios.deployment_target = "9.0"
  
  spec.platform = :osx
  spec.osx.deployment_target = "10.11"
  
  spec.platform = :tvos
  spec.tvos.deployment_target = "9.0"
  
  spec.swift_version = "5.1"

  spec.source = { :git => "https://github.com/nakkht/quick-constraint.git", :tag => "v#{spec.version}" }

  spec.source_files = "Sources/**/*.swift"

end
