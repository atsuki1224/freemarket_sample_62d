require 'rails_helper'
describe ProductsController do
  describe 'GET #show' do
    it "assigns the requested product to @product" do
      product = FactoryBot.create(:product)
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq product
    end

    it "renders the :show template" do
      product = FactoryBot.create(:product)
      get :show, params: { id: product.id }
      expect(response).to render_template :show
    end
  end
end