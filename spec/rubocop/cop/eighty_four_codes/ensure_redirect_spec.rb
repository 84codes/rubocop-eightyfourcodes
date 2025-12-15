# frozen_string_literal: true

require "./spec/spec_helper"

RSpec.describe RuboCop::Cop::EightyFourCodes::EnsureRedirect, :config do
  let(:config) { RuboCop::Config.new }
  let(:cop_name) { "EightyFourCodes/EnsureRedirect" }
  let(:cop_message) { "#{cop_name}: Do not redirect from an `ensure` block." }

  it "registers an offense and corrects for redirect in ensure" do
    expect_offense(<<~RUBY)
      begin
        something
      ensure
        file.close
        redirect "/"
        ^^^^^^^^^^^^ #{cop_message}
      end
    RUBY

    expect_no_corrections
  end

  it "registers an offense and corrects for redirect with argument in ensure" do
    expect_offense(<<~RUBY)
      begin
        foo
      ensure
        redirect "/"
        ^^^^^^^^^^^^ #{cop_message}
      end
    RUBY

    expect_no_corrections
  end

  it "registers an offense when redirecting multiple values in `ensure`" do
    expect_offense(<<~RUBY)
      begin
        something
      ensure
        do_something
        redirect "/", 303
        ^^^^^^^^^^^^^^^^^ #{cop_message}
      end
    RUBY

    expect_no_corrections
  end

  it "does not register an offense for redirect outside ensure" do
    expect_no_offenses(<<~RUBY)
      begin
        something
        redirect "/"
      ensure
        file.close
      end
    RUBY
  end

  it "does not check when ensure block has no body" do
    expect_no_offenses(<<~RUBY)
      begin
        something
      ensure
      end
    RUBY
  end
end
