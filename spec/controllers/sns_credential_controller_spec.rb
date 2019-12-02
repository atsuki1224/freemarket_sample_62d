require 'rails_helper'

describe Users::OmniauthCallbacksController, type: :controller do
  describe 'sns-#signup' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      OmniAuth.config.test_mode = true
      redirect_to(root_path)
    end
    after do
      OmniAuth.config.test_mode = false
    end
    describe "sns login" do
      before do
        request.env["omniauth.auth"] = OmniAuth::AuthHash.new(
          "uid"=> "102786333664882466051",
          "provider"=> "google_oauth2",
      )
      request.env['warden'] = OmniAuth::AuthHash.new(
        {
          :default_scope=>:user, :scope_defaults=>{},
          :default_strategies=>{
            :user=>[:rememberable,
                  :database_authenticatable]
          }}
      )
      end
      subject do
        @user = create(:user)
        post :google_oauth2
      end
      it "google_oauth2 after mypage( sns-signin )" do
        expect(subject).to redirect_to(mypage_index_path)
      end
    end
    describe "sns not login" do
      before do
        request.env["omniauth.auth"] = OmniAuth::AuthHash.new(
          "uid"=> "0000",
          "provider"=> "google_oauth2",
          "info"=> { 
            "name"=> "anonymous",
            "email"=> "aaa@bbb"}
      )
      request.env['warden'] = OmniAuth::AuthHash.new(
        {
          :default_scope=>:user, :scope_defaults=>{},
          :default_strategies=>{
            :user=>[:rememberable,
                  :database_authenticatable]
          }}
      )
      end
      subject do
        @user = create(:user)
        post :google_oauth2
      end
      it "google_oauth2 after not-mypage( sns-not-signin )" do
        expect(subject).not_to redirect_to(mypage_index_path)
      end
    end
  end
end