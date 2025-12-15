# frozen_string_literal: true

require_relative "lib/rubocop/eightyfourcodes/version"

Gem::Specification.new do |spec|
  spec.name = "rubocop-eightyfourcodes"
  spec.version = RuboCop::EightyFourCodes::VERSION
  spec.authors = ["84codes"]
  spec.email = ["developers@84codes.com"]

  spec.summary = "This is a collection of cops developed and used by 84codes AB."
  spec.description = <<~DESCRIPTION
    A plugin for the RuboCop code style enforcing & linting tool.
  DESCRIPTION
  spec.homepage = "https://github.com/84codes/rubocop-eightyfourcodes"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4.0"

  spec.metadata = {
    "rubygems_mfa_required" => "true",
  }

  spec.files         = Dir["LICENSE.md", "config/**/*.yml", "lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop", [">= 1.69.0", "< 2"]
  spec.add_dependency "rubocop-minitest"
  spec.add_dependency "rubocop-performance"
  spec.add_dependency "rubocop-rake"
  spec.add_dependency "rubocop-sequel"

  spec.extra_rdoc_files = ["LICENSE.md", "README.md"]
end
