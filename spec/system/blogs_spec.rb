require 'rails_helper'

RSpec.describe 'Blogs', type: :system do

    before do
        Capybara.page.driver.browser.manage.window.maximize
        Capybara.default_max_wait_time = 2
    end

    scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
        visit blogs_path
        click_link "New Blog"
        fill_in 'Title', with: ''
        expect{click_button "Save"}.to change(Blog, :count).by(0)
        expect(page).to have_content "Title can't be blank"
    end


    scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存されトップ画面に遷移すること' do
        visit blogs_path
        click_link "New Blog"
        fill_in 'Title', with: 'this is title'
        expect{click_button "Save"}.to change(Blog, :count).by(1)
        expect(current_path).to eq root_path
        expect(page).to have_content 'Success to create new blog'
    end

end