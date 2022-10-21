# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な会員の場合は登録されるか" do
    expect(FactoryBot.build(:member)).to be_valid
  end
end