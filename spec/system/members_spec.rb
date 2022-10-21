# frozen_string_literal: true

require 'rails_helper'

describe '新規登録のテスト' do
  let!(:member) { create(:member, last_name:'テスト',first_name:'たろう', nickname:'テストさん', email:'test@example.com', introduction:'body', phone_number:'01234567890', password:'testtest', password_confirmation:'testtest') }

  describe '新規登録(new_member_registration_path)のテスト' do
    before do
      visit new_member_registration_path
    end
    context '表示の確認' do
      it 'URLが正しいか' do
        expect(current_path).to eq('/members/sign_up')
      end
      it '新規登録ボタンが表示されているか' do
        expect(page).to have_button '新規登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'member[last_name]', with: Faker::Lorem.characters(number:3)
        fill_in 'member[first_name]', with: Faker::Lorem.characters(number:3)
        fill_in 'member[nickname]', with: Faker::Lorem.characters(number:5)
        fill_in 'member[email]', with: Faker::Internet.email
        fill_in 'member[introduction]', with: Faker::Lorem.characters(number:4)
        fill_in 'member[phone_number]', with: Faker::Lorem.characters(number:11)
        fill_in 'member[password]', with: 'password'
        fill_in 'member[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(Member.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/members/' + Member.last.id.to_s
      end
    end
  end

  describe 'メンバーログイン' do
    let(:member) { create(:member) }

    before do
      visit new_member_session_path
    end

    context '表示の確認' do
      it 'URLが正しいか' do
        expect(current_path).to eq('/members/sign_in')
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'member[email]', with: member.email
        fill_in 'member[password]', with: member.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている' do
        expect(current_path).to eq '/members/' + member.id.to_s
      end
    end
  end

end