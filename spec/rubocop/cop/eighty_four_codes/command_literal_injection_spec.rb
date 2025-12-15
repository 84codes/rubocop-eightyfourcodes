# frozen_string_literal: true

require "./spec/spec_helper"

RSpec.describe RuboCop::Cop::EightyFourCodes::CommandLiteralInjection, :config do
  let(:config) { RuboCop::Config.new }
  let(:cop_name) { "EightyFourCodes/CommandLiteralInjection" }
  let(:cop_message) do
    "#{cop_name}: Do not include variables command literals. Use parameters \"system(cmd, params)\" or exec() instead"
  end

  describe "%x commands with interpolation" do
    it "registers an offense" do
      expect_offense(<<~RUBY)
        my_var = 1
        %x(cat \#{my_var})
        ^^^^^^^^^^^^^^^^^ #{cop_message}
      RUBY
    end

    it "registers an offense if command conitnues" do
      expect_offense(<<~RUBY)
        my_var = 1
        %x(cat \#{my_var} | less)
        ^^^^^^^^^^^^^^^^^^^^^^^^ #{cop_message}
      RUBY
    end

    it "registers an offense if variable is at the beginning" do
      expect_offense(<<~RUBY)
        my_var = 1
        %x(\#{my_var} | less)
        ^^^^^^^^^^^^^^^^^^^^ #{cop_message}
      RUBY
    end

    it "allows %x without arguments" do
      expect_no_offenses(<<-RUBY)
         %x(cat /var/log/syslog)
      RUBY
    end
  end

  describe "`` commands with interpolation" do
    it "registers an offense" do
      expect_offense(<<~RUBY)
        my_var = 1
        `cat \#{my_var}`
        ^^^^^^^^^^^^^^^ #{cop_message}
      RUBY
    end

    it "registers an offense if command conitnues" do
      expect_offense(<<~RUBY)
        my_var = 1
        `cat \#{my_var} | less`
        ^^^^^^^^^^^^^^^^^^^^^^ #{cop_message}
      RUBY
    end

    it "registers an offense if variable is at the beginning" do
      expect_offense(<<~RUBY)
        my_var = 1
        `\#{my_var} | less`
        ^^^^^^^^^^^^^^^^^^ #{cop_message}
      RUBY
    end

    it "registers an offense on multiple variables" do
      expect_offense(<<~RUBY)
        my_var = 1
        `cat \#{my_var} | less \#{my_var}`
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #{cop_message}
      RUBY
    end

    it "allows %x without arguments" do
      expect_no_offenses(<<-RUBY)
        `cat /var/log/syslog`
      RUBY
    end
  end
end
