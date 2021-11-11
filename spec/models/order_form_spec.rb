require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_form = FactoryBot.build(:order_form, item_id: item.id, user_id: user.id)
      sleep 0.1
    end
      context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'codeが空だと保存できないこと' do
        @order_form.code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Code can't be blank")
      end
      it 'codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_form.code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Code is invalid. Include hyphen(-)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @order_form.area_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @order_form.telephone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁以上11桁以内の半角数値ではないと保存できないこと' do
        @order_form.telephone_number = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is invalid.')
      end
      it 'item_idが紐付いていないと保存できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end


end
