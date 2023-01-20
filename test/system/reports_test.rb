# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'テスト技法'
    fill_in '内容', with: 'テストの学習をした'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'テスト技法'
    assert_text 'テストの学習をした'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'rails'
    fill_in '内容', with: 'railsの学習をした'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text 'rails'
    assert_text 'railsの学習をした'
  end

  test 'destroying a Report' do
    visit reports_url
    assert_text 'モデルテスト'
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text 'モデルテスト'
  end
end
