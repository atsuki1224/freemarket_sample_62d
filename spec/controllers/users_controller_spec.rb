require 'rails_helper'

describe Users::RegistrationsController, type: :controller do
  let(:test_user) {build(:user)}
  let(:test_address) {build(:address)}
  let(:test_card) {build(:card)}
  let(:page_3_params) { {
    birthday: {
      "birthday(1i)": test_user.birthday.year,
      "birthday(2i)": test_user.birthday.month,
      "birthday(3i)":test_user.birthday.day
    },
    user: {
      email: test_user.email,
      password: test_user.password,
      firstname: test_user.firstname,
      firstname_kana: test_user.firstname_kana,
      lastname: test_user.lastname,
      lastname_kana: test_user.lastname_kana,
      nickname: test_user.nickname,
    }
  } }
  let(:page_6_params) { {
    user: {
      address_attributes: {
        zipcode: test_address.zipcode,
        prefecture_id: test_address.prefecture_id,
        city: test_address.city,
        address: test_address.address,
        phone_number: test_address.phone_number
      }
    }
  } }
  let(:page_7_params) { {
    exp_year: "2020",
    exp_month: "12",
    user: {
      email: test_user.email,
      password: test_user.password,
      firstname: test_user.firstname,
      firstname_kana: test_user.firstname_kana,
      lastname: test_user.lastname,
      lastname_kana: test_user.lastname_kana,
      nickname: test_user.nickname,
      birthday: test_user.birthday,
      card_attributes: {
        card_number: test_card.card_number,
        validated_data: test_card.validated_data,
        security_code: test_card.security_code
      }
    }
  } }
  let(:page_7_session) { {
    email: test_user.email,
    password: test_user.password,
    firstname: test_user.firstname,
    firstname_kana: test_user.firstname_kana,
    lastname: test_user.lastname,
    lastname_kana: test_user.lastname_kana,
    nickname: test_user.nickname,
    birthday: test_user.birthday,
    address_attributes: {
      zipcode: test_address.zipcode,
      prefecture_id: test_address.prefecture_id,
      city: test_address.city,
      address: test_address.address,
      building_name: test_address.building_name,
      phone_number: test_address.phone_number
    }
  } }
  let(:noCard_params) { {
    exp_year: "2020",
    exp_month: "12",
    user: {
      email: test_user.email,
      password: test_user.password,
      firstname: test_user.firstname,
      firstname_kana: test_user.firstname_kana,
      lastname: test_user.lastname,
      lastname_kana: test_user.lastname_kana,
      nickname: test_user.nickname,
      birthday: test_user.birthday,
      card_attributes: {
        card_number: test_card.card_number
      }
    }
  } }
  let(:noAddress_session) { {
    email: test_user.email,
    password: test_user.password,
    firstname: test_user.firstname,
    firstname_kana: test_user.firstname_kana,
    lastname: test_user.lastname,
    lastname_kana: test_user.lastname_kana,
    nickname: test_user.nickname,
    birthday: test_user.birthday
  } }


  describe '#signup' do
    context "registration_actions" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
      end
      it "renders the :registration_1 template" do
        get :registration_1
        expect(response).to render_template :registration_1
      end
      it "renders the :registration_2 template" do
        get :registration_2
        expect(response).to render_template :registration_2
      end
      context "registration_3 action" do
        before do
          get :registration_3,
           params: page_3_params
        end
        it "renders the :registration_3 template" do
          expect(response).to render_template :registration_3
        end
        it "params value on sesion(registration3)" do
          expect(session.keys).to eq ["nickname", "email", "password", "firstname", "lastname", "firstname_kana", "lastname_kana", "birthday"]
        end
      end
      it "renders the :registration_4 template" do
        get :registration_4
        expect(response).to render_template :registration_4
      end
      it "renders the :registration_5 template" do
        get :registration_5
        expect(response).to render_template :registration_5
      end
      context "registration_6 action" do
        before do
          get :registration_6,
           params: page_6_params
        end
        it "renders the :registration_6 template" do
          expect(response).to render_template :registration_6
        end
        it "params value on sesion(registration6)" do
          expect(session[:address_attributes].keys).to eq ["zipcode", "prefecture_id", "city", "address", "phone_number"]
        end
      end
      context "registration_7 can save action" do
        subject do
          post :registration_7, params: page_7_params, session: page_7_session
        end
        it "renders the registration_7 template" do
          expect(subject).to render_template :registration_7
        end
        it "User Record can save"do
          expect{subject}.to change(User, :count)
        end
        it "Address Record can save"do
          expect{subject}.to change(Address, :count)
        end
        it "Card Record can save"do
          expect{subject}.to change(Card, :count)
        end
      end
      context "registration_7(noAddress) can not save action" do
        subject do
          post :registration_7, params: page_7_params, session: noAddress_session
        end
        it "renders the registration_7 template" do
          expect(subject).to redirect_to(root_path)
        end
        it "User Record can save"do
          expect{subject}.not_to change(User, :count)
        end
        it "Address Record can save"do
          expect{subject}.not_to change(Address, :count)
        end
        it "Card Record can save"do
          expect{subject}.not_to change(Card, :count)
        end
      end
      context "registration_7(noCard) can not save action" do
        subject do
          post :registration_7, params: noCard_params, session: page_7_session
        end
        it "renders the registration_7 template" do
          expect(subject).to redirect_to(root_path)
        end
        it "User Record can save"do
          expect{subject}.not_to change(User, :count)
        end
        it "Address Record can save"do
          expect{subject}.not_to change(Address, :count)
        end
        it "Card Record can save"do
          expect{subject}.not_to change(Card, :count)
        end
      end
    end
  end

end
