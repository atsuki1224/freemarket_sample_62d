require 'rails_helper'
describe ProductsController do
  let(:user){create(:user)}
  let(:category){create(:category)}
  let(:bland){create(:bland)}
  let(:image){create(:image)}
  describe '#new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    let(:params) { { user_id:user.id,category_id:category.id,bland_id:bland.id,product: attributes_for(:product,image:{image:image.image})} }
    context 'can save' do
      subject{
        post:create,
        params: params
      }
      it 'count up product' do
        expect{subject}.to change(Product, :count).by(1).and change(Image, :count).by(1)
      end
    end

    context 'can not save' do
      let(:invalid_params) { {user_id:user.id,category_id:category.id,bland_id:bland.id,product: attributes_for(:product,item_name:nil) }}
      subject{
        post:create,
        params: invalid_params
      }
      it 'does not count up' do
        expect{subject}.not_to change(Product, :count)
      end
    end
    context 'can not save' do
      let(:invalid_params) { {user_id:user.id,category_id:category.id,bland_id:bland.id,product: attributes_for(:product,description:nil) }}
      subject{
        post:create,
        params: invalid_params
      }

      it 'does not count up' do
        expect{subject}.not_to change(Product, :count)
      end
    end
    context 'can not save' do
      let(:invalid_params) { {user_id:user.id,category_id:category.id,bland_id:bland.id,product: attributes_for(:product,delivery_charge:nil) }}
      subject{
        post:create,
        params: invalid_params
      }
      it 'does not count up' do
        expect{subject}.not_to change(Product, :count)
      end
    end
    context 'can not save' do
      let(:invalid_params) { {user_id:user.id,category_id:category.id,bland_id:bland.id,product: attributes_for(:product,delivery_area:nil) }}
      subject{
        post:create,
        params: invalid_params
      }

      it 'does not count up' do
        expect{subject}.not_to change(Product, :count)
      end
    end
    context 'can not save' do
      let(:invalid_params) { {user_id:user.id,category_id:category.id,bland_id:bland.id,product: attributes_for(:product,price:nil) }}
      subject{
        post:create,
        params: invalid_params
      }
      it 'does not count up' do
        expect{subject}.not_to change(Product, :count)
      end
    end
  end
end
