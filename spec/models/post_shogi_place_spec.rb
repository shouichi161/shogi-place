# frozen_string_literal: true

require 'rails_helper'

describe 'customerモデルのテスト' do
  it "会員情報が有効な内容の場合に保存されるか" do
    expect(FactoryBot.build(:customer)).to be_valid
  end
end
