require 'rails_helper'

# This is just a sanity test for the rspec suite
RSpec.describe Pagescript do
  it "should be versioned" do
    expect(Pagescript::VERSION).to_not be_nil
  end
end
