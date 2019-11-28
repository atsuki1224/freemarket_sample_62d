require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      # 氏名 カナ 愛称 誕生日 売上 ポイント 紹介文. Eメール パス
      it 'is valid with user_all_elements' do
        expect(build(:user)).to be_valid
      end
      it 'is valid with no-profile-text' do
        expect(build(:user,user_profile: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without firstname' do
        user = build(:user,firstname: nil)
        user.valid?
        expect(user.errors[:firstname]).to include("can't be blank")
      end
      it 'is invalid without lastname' do
        user = build(:user,lastname: nil)
        user.valid?
        expect(user.errors[:lastname]).to include("can't be blank")
      end
      it 'is invalid without email' do
        user = build(:user,email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      it 'is invalid without password' do
        user = build(:user,password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      it 'is invalid without nickname' do
        user = build(:user,nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it 'is invalid without birthday' do
        user = build(:user,birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
      end
      it 'is invalid without total_profit' do
        user = build(:user,total_profit: nil)
        user.valid?
        expect(user.errors[:total_profit]).to include("can't be blank")
      end
      it 'is invalid without point' do
        user = build(:user,point: nil)
        user.valid?
        expect(user.errors[:point]).to include("can't be blank")
      end
    end

  end
end
