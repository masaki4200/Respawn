require 'rails_helper'

describe 'ユーザー権限のテスト'  do
  let!(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }
  describe 'ログインしていない場合' do
    context '投稿関連のURLにアクセス' do
      it '一覧画面に遷移できない' do
        visit users_items_path
        expect(current_path).to eq('users/users/sign_in')
      end
      it '編集画面に遷移できない' do
        visit edit_users_item_path(book.id)
        expect(current_path).to eq('users/users/sign_in')
      end
      it '詳細画面に遷移できない' do
        visit users_item_path(book.id)
        expect(current_path).to eq('users/users/sign_in')
      end
    end
  end
  describe 'ログインしていない場合にユーザー関連のURLにアクセス' do
    context 'ユーザー関連のURLにアクセス' do
      it '一覧画面に遷移できる' do
        visit users_users_path
        expect(current_path).to eq('users/users/sign_in')
      end
      it '編集画面に遷移できる' do
        visit edit_users_user_path(user.id)
        expect(current_path).to eq('users/users/sign_in')
      end
      it '詳細画面に遷移できる' do
        visit users_user_path(user.id)
        expect(current_path).to eq('users/users/sign_in')
      end
    end
  end
end