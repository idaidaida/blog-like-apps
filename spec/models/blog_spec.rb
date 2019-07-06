require 'rails_helper'

RSpec.describe Blog, type: :model do
  
  it "titleがあれば有効な状態であること" do
    blog = Blog.new
    blog.title = "Tarou"
    blog.valid?
    expect(blog.valid?).to be true 
  end

  it "titleがなければ無効な状態であること" do
    blog = Blog.new
    blog.valid?
    expect(blog.valid?).to be false 
  end

end
