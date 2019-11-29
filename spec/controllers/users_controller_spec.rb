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
      it "renders the :signup template" do
        get :signup
        expect(response).to render_template :signup
      end
      it "renders the :registration template" do
        get :registration
        expect(response).to render_template :registration
      end
      context "sms_confirmation action" do
        before do
          get :sms_confirmation,
           params: page_3_params
        end
        it "renders the :sms_confirmation template" do
          expect(response).to render_template :sms_confirmation
        end
        it "params value on sesion(registration3)" do
          expect(session.keys).to eq ["nickname", "email", "password", "firstname", "lastname", "firstname_kana", "lastname_kana", "birthday"]
        end
      end
      it "renders the :sms_confirmation_sms template" do
        get :sms_confirmation_check
        expect(response).to render_template :sms_confirmation_check
      end
      it "renders the :address_confirmation template" do
        get :address_confirmation
        expect(response).to render_template :address_confirmation
      end
      context ":card_confirmation action" do
        before do
          get :card_confirmation,
           params: page_6_params
        end
        it "renders the :card_confirmation template" do
          expect(response).to render_template :card_confirmation
        end
        it "params value on sesion(card_confirmation)" do
          expect(session[:address_attributes].keys).to eq ["zipcode", "prefecture_id", "city", "address", "phone_number"]
        end
      end
      context ":complete can save action" do
        subject do
          post :complete, params: page_7_params, session: page_7_session
        end
        it "renders the :complete template" do
          expect(subject).to render_template :complete
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
      context ":complete(noAddress) can not save action" do
        subject do
          post :complete, params: page_7_params, session: noAddress_session
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
      context ":complete(noCard) can not save action" do
        subject do
          post :complete, params: noCard_params, session: page_7_session
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
