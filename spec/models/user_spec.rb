require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a new user' do
      user = User.new({email: "test@test.com", first_name: "John", last_name: "Doe", password: "password", password_confirmation: "password"})
      expect(user.valid?).to eql(true) 
    end
    it 'should not create a new user when email is not present' do
      user = User.new({email: nil, first_name: "John", last_name: "Doe", password: "password", password_confirmation: "password"})
      expect(user.valid?).to eql(false)
      # expect(user.errors[:password_confirmation].to include("doesn't match Password"))
    end
    it 'should not create a new user when first_name is not present' do
      user = User.new({email: "test@test.com", first_name: nil, last_name: "Doe", password: "password", password_confirmation: "password"})
      expect(user.valid?).to eql(false)
      # expect(user.errors[:password_confirmation].to include("doesn't match Password"))
    end
    it 'should not create a new user when last_name is not present' do
      user = User.new({email: "test@test.com", first_name: "John", last_name: nil, password: "password", password_confirmation: "password"})
      expect(user.valid?).to eql(false)
      # expect(user.errors[:password_confirmation].to include("doesn't match Password"))
    end
    it 'should not create a new user when password is not present' do
      user = User.new({email: "test@test.com", first_name: "John", last_name: "Doe", password: nil, password_confirmation: "password"})
      expect(user.valid?).to eql(false)
      # expect(user.errors[:password_confirmation].to include("doesn't match Password"))
    end
    it 'should not create a new user when password is not present' do
      user = User.new({email: "test@test.com", first_name: "John", last_name: "Doe", password: "password", password_confirmation: nil})
      expect(user.valid?).to eql(false)
      # expect(user.errors[:password_confirmation].to include("doesn't match Password"))
    end
    it 'should not create a new user when password and password_confirmation do not match' do
      user = User.new({email: "test@test.com", first_name: "John", last_name: "Doe", password: "wordpass", password_confirmation: "password"})
      expect(user.valid?).to eql(false)
      # expect(user.errors[:password_confirmation].to include("doesn't match Password"))
    end
    it 'should not create a new user when email already exists' do
      @user1 = User.create({email: "test@test.com", first_name: "John", last_name: "Doe", password: "password", password_confirmation: "password"})
      @user2 = User.create({email: "TEST@TEST.com", first_name: "John", last_name: "Doe", password: "password", password_confirmation: "password"})
      expect(@user2.valid?).to eql(false)
      # expect(user.errors[:email].to include(""))
    end
    it 'should not create a new user when password is less than 8 characters' do
      user = User.new({email: "test@test.com", first_name: "John", last_name: "Doe", password: "passwor", password_confirmation: "passwor"})
      expect(user.valid?).to eql(false)
    end
  end
  # describe '.authenticate_with_credentials' do
  #   it 'should save user with '
  # end
end