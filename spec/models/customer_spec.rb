# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "customer",type: :system do
  describe 'customerモデルのテスト' do
    it "会員情報が有効な内容の場合に保存されるか" do
      expect(FactoryBot.build(:customer)).to be_valid
    end
  end

  describe '会員のテスト' do
    before do
      @customer = FactoryBot.create(:customer) #FactoryBotをを利用してcustomerデータを作成
      sign_in @customer
      visit customers_path
    end

    describe '会員一覧のテスト' do
      context '表示の確認' do
        it '会員情報が表示されているか' do
          expect(page).to have_content @customer.name
      　end
      end
    end

    describe '会員詳細のテスト' do
      before do
        visit customer_path(@customer)
      end
      context '表示の確認' do
        it '編集リンクが存在しているか' do
          expect(page).to have_link '編集する'
        end
      end
    end

  end
end