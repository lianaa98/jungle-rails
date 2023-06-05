require 'rails_helper'

RSpec.describe User, type: :model do
  # Must be created with password and password_confirmation field
  describe 'Validations' do
    it 'must have a password' do
      @user = User.new(
        name: 'test',
        email: 'example@email.com'
      )
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    # Password and password_confirmation must match
    it 'fails if password and password_confirmation do not match' do
      @user = User.new(
        name: 'test',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'password1'
      )
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # Happy path for password and confirmation matching
    it 'must have a matching password and password_confirmation' do
      @user = User.new(
        name: 'test',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      expect(@user).to be_valid
    end

    # Email must be unique
    it 'must have a unique email' do
      @user1 = User.new(
        name: 'test',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user1.save
      @user2 = User.new(
        name: 'test',
        email: @user1.email,
        password: 'password',
        password_confirmation: 'password'
      )
      @user2.save
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'emails are NOT case-sensitive' do
      @user1 = User.new(
        name: 'test',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user1.save
      @user2 = User.new(
        name: 'test',
        email: 'EXAMPLE@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user2.save
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end


end
