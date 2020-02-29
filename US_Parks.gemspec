lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "US_Parks/version"

Gem::Specification.new do |spec|
  spec.name          = "US_Parks"
  spec.version       = USParks::VERSION
  spec.authors       = ["Khris Punzalan"]
  spec.email         = ["khrispunzalan@gmail.com"]

  spec.summary       = %q{This gem scrapes all states and parks from nps.gov/index.htm}
  spec.description   = %q{This CLI (Command Line Interface) allows you to access information about the different parks in each US State and territory.}
  spec.homepage      = "https://github.com/khris22/US_Parks.git"
  spec.license       = "MIT"

   # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
   # delete this section to allow pushing this gem to any host.

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
