# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  password_digest :text
#  session_token   :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user_bob) { User.create(username: "bob", password: "abc123") }
  subject(:user_sally) { User.create(username: "sally", password: "fun") }


  context "validate username" do
    it { should validate_presence_of(:username) }
  end

  context "validate password" do
    it "if present, password has length of 6 or more characters" do
      expect(user_bob.password.length >= 6).to eq(true)
      expect(user_sally.password.length >= 6).to eq(false)
    end
  end

  context "calls ensure_session_token before validation" do
    it "user should have a session_token" do
      expect(user_bob.session_token).to_not eq(nil)
    end
  end


  context "is_password? checks if given password is correct" do
    it "returns true if password is correct" do
      expect(user_bob.is_password?("abc123")).to eq(true)
    end

    it "returns false if password is incorrect" do
      expect(user_bob.is_password?("not password")).to eq(false)
    end
  end


end
