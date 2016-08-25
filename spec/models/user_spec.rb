require 'rails_helper'

describe User do
  describe '#create' do
    describe 'with valid attributes' do
      it "is valid with all information" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

  describe 'without valid attributes' do

    context 'nickname' do
      it "is valid with a nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
    end

    context 'email' do
      it 'is invalid without a email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
    end

    context 'password' do
      it 'is invalid without a password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
    end

    context 'password_confirmation' do
      it 'is invalid without a password_confirmation although with a password' do
        user = build(:user, password_confirmation: '00000')
        user.valid?
        expect(user.errors[:password_confirmation][0]).to include("doesn't match Password")
      end
    end

    context 'email address' do
      it 'is invalid with a duplicate email address' do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
    end

    context 'password character limit' do
      it 'is invalid with a password that has less than 5 characters' do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end
    end

  end
end
end
