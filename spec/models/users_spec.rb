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
      let(:user) { build(:user,firstname: nil, lastname: nil, email: nil, password: nil, nickname: nil, birthday: nil, total_profit: nil, point: nil) }
      before {user.valid?}
      it 'is invalid without firstname' do
        expect(user.errors[:firstname]).to include("can't be blank")
      end
      it 'is invalid without lastname' do
        expect(user.errors[:lastname]).to include("can't be blank")
      end
      it 'is invalid without email' do
        expect(user.errors[:email]).to include("can't be blank")
      end
      it 'is invalid without password' do
        expect(user.errors[:password]).to include("can't be blank")
      end
      it 'is invalid without nickname' do
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it 'is invalid without birthday' do
        expect(user.errors[:birthday]).to include("can't be blank")
      end
      it 'is invalid without total_profit' do
        expect(user.errors[:total_profit]).to include("can't be blank")
      end
      it 'is invalid without point' do
        expect(user.errors[:point]).to include("can't be blank")
      end
    end

  end
end
