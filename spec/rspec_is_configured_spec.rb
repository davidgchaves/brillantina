require "rails_helper"

describe "rspec" do
  it "verifies true" do
    expect(true).to eq true
  end

  xit "can fail" do
    expect(true).to eq false
  end
end
