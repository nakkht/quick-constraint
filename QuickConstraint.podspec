Pod::Spec.new do |spec|

  spec.name = "QuickConstraint"
  spec.version = "0.2.1"
  spec.summary = "Short and fast auto layout done programmatically."
  spec.description  = <<-DESC
  Short and simple. Lay the views programmatically in more concise way.
                   DESC

  spec.homepage = "https://github.com/nakkht/quick-constraint"
  spec.license = { :type => "Apache v2.0", :file => "LICENSE" }

  spec.author = { "Paulius Gudonis" => "pg@neqsoft.com" }
  spec.social_media_url = "https://twitter.com/nakkht"

  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.11"
  spec.tvos.deployment_target = "9.0"
  
  spec.swift_version = "5.2"

  spec.source = { :git => "https://github.com/nakkht/quick-constraint.git", :tag => "v#{spec.version}" }

  spec.source_files = "Sources/**/*.swift"

end
