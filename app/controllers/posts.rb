post '/post/new' do
  byebug
  title = params[:title]
  content = params[:content]
  tags = params[:tags]

  @post = Post.new(title: title, content: content)

  tags.each_key do |tag|
    @tag = Tag.find_by name: tag
    @tag.posts << @post
  end

  @post.save
end