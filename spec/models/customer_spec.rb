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
          expect(page).to have_content @customer.chess_ability
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
      context 'リンクの移動先を確認' do
        it '編集の移動先は編集画面か' do
          edit_link = find_all('a')[6]
          edit_link.click
          expect(current_path).to eq('/customers/' + @customer.id.to_s + '/edit')
        end
      end
    end

    describe '編集画面のテスト' do
      before do
        visit edit_customer_path(@customer)
      end
      context '表示の確認' do
        it '編集前の情報がフォームに表示されている' do
          expect(page).to have_field 'customer[name]',with:@customer.name
          expect(page).to have_field 'customer[email]',with:@customer.email
          expect(page).to have_field 'customer[chess_ability]',with:@customer.chess_ability
        end
        it '保存ボタンが表示される' do
          expect(page).to have_button '変更内容を保存'
        end
      end
      context '更新処理に関するテスト' do
        it '更新後のリダイレクト先は正しいか' do
          fill_in 'customer[name]',with:Faker::Name.name
          fill_in 'customer[email]',with:Faker::Internet.email
          fill_in 'customer[chess_ability]',with:'三段'
          click_button '変更内容を保存'
          expect(page).to have_current_path customer_path(@customer)
        end
      end
    end

  end
end
