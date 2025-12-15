# frozen_string_literal: true

require "./spec/spec_helper"

RSpec.describe RuboCop::Cop::EightyFourCodes::RubyVersionFile, :config do
  let(:config) { RuboCop::Config.new }
  let(:cop_name) { "EightyFourCodes/RubyVersionFile" }
  let(:cop_message) do
    "#{cop_name}: Control Ruby version via .ruby-version, fix by replacing with File.read('.ruby-version')"
  end

  it "registers an offense defined with double quotes" do
    expect_offense(<<~RUBY, "Gemfile")
      ruby "2.6.6"
           ^^^^^^^ #{cop_message}
    RUBY

    expect_correction(<<~RUBY)
      ruby File.read('.ruby-version')
    RUBY
  end

  it "registers an offense defined with single quotes" do
    expect_offense(<<~RUBY, "Gemfile")
      ruby '2.1.0'
           ^^^^^^^ #{cop_message}
    RUBY

    expect_correction(<<~RUBY)
      ruby File.read('.ruby-version')
    RUBY
  end

  it "does not register an offense when not in Gemfile" do
    expect_no_offenses(<<~RUBY, "test.rb")
      ruby '2.1.0'
    RUBY
  end

  it "does not register an offense when reading .ruby-version" do
    expect_no_offenses(<<~RUBY, "Gemfile")
      ruby File.read('.ruby-version')
    RUBY
  end
end
