require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with product' do
        expect(build(:product,size: nil)).to be_valid
      end
      it 'is valid with text' do
        expect(build(:product,bland_id: nil)).to be_valid
      end
      it 'is valid with product_all_elements' do
        expect(build(:product)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without item_name' do
        product = build(:product,item_name: nil)
        product.valid?
        expect(product.errors[:item_name]).to include("can't be blank")
      end
      it 'is invalid without description' do
        product = build(:product,description: nil)
        product.valid?
        expect(product.errors[:description]).to include("can't be blank")
      end
      it 'is invalid without condition' do
        product = build(:product,item_condition: nil)
        product.valid?
        expect(product.errors[:item_condition]).to include("can't be blank")
      end
      it 'is invalid without status' do
        product = build(:product,trade_status: nil)
        product.valid?
        expect(product.errors[:trade_status]).to include("can't be blank")
      end
      it 'is invalid without category_id' do
        product = build(:product,category_id: nil)
        product.valid?
        expect(product.errors[:category_id]).to include("can't be blank")
      end
      it 'is invalid without delivery_charge' do
        product = build(:product,delivery_charge: nil)
        product.valid?
        expect(product.errors[:delivery_charge]).to include("can't be blank")
      end
      it 'is invalid without delivery_method' do
        product = build(:product,delivery_method: nil)
        product.valid?
        expect(product.errors[:delivery_method]).to include("can't be blank")
      end
      it 'is invalid without delivery_area' do
        product = build(:product,delivery_area: nil)
        product.valid?
        expect(product.errors[:delivery_area]).to include("can't be blank")
      end
      it 'is invalid without delivery_time' do
        product = build(:product,delivery_time: nil)
        product.valid?
        expect(product.errors[:delivery_time]).to include("can't be blank")
      end
      it 'is invalid without price' do
        product = build(:product,price: nil)
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end
      it 'is invalid without user_id' do
        product = build(:product,user_id: nil)
        product.valid?
        expect(product.errors[:user_id]).to include("can't be blank")
      end

    end
  end
end
