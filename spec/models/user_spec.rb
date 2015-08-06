require 'rails_helper'

describe User, type: :model do
  let(:valid_email)      { 'email@example.com' }
  let(:invalid_email)    { 'email@gmail.com' }
  let(:valid_password)   { '0123456789' }
  let(:invalid_password) { '123456789' }

  it "rejects emails not on example.com" do
    user = User.create email: invalid_email,
                       password: valid_password
    expect(user).not_to be_valid
  end

  it "allows emails on example.com" do
    user = User.create email: valid_email,
                       password: valid_password
    expect(user).to be_valid
  end

  it "rejects passwords with less than 10 characters" do
    user = User.create email: valid_email,
                       password: invalid_password
    expect(user).not_to be_valid
  end

  it "accepts passwords with at least 10 characters" do
    user = User.create email: valid_email,
                       password: valid_password
    expect(user).to be_valid
  end
end
