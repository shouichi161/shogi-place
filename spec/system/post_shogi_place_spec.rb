require 'rails_helper'

RSpec.describe "Post_shogi_places",type: :system do
  before do
    @customer = FactoryBot.create(:customer) #FactoryBotをを利用してcustomerデータを作成
    sign_in @customer
  end

  describe '投稿画面(new_post_shogi_place_path)のテスト' do
    before do
      visit new_post_shogi_place_path
    end
    context '表示の確認' do
      it 'new_post_shogi_place_pathが"/post_shogi_places/new"であるか' do
        expect(current_path).to eq('/post_shogi_places/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿する'
      end
    end
  end

end
