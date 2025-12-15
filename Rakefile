# frozen_string_literal: true

require "bundler/setup"
require "rspec/core/rake_task"
require "rubocop/rake_task"

require_relative "lib/rubocop/eightyfourcodes/version"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList["spec/**/*_spec.rb"]
end

desc "Generate a new cop with a template"
task :new_cop, [:cop] do |_task, args|
  require "rubocop"

  cop_name = args.fetch(:cop) do
    warn "usage: bundle exec rake new_cop[Department/Name]"
    exit!
  end

  generator = RuboCop::Cop::Generator.new(cop_name)

  generator.write_source
  generator.write_spec
  generator.inject_require(root_file_path: "lib/rubocop/cop/eightyfourcodes_cops.rb")
  generator.inject_config(config_file_path: "config/default.yml")

  puts generator.todo
end

namespace :git do
  version = RuboCop::EightyFourCodes::VERSION
  tag = "v#{version}"

  desc "Create a signed git tag named: #{tag}"
  task :tag do
    command = %(git tag --sign --message="Version #{version}" #{tag})

    system(command, exception: true)
  end
end
