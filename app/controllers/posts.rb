post '/post/new' do
  title = params[:title]
  content = params[:content]
  tags = params[:tags]

  @post = Post.new(title: title, content: content)

  tags.each_key do |tag|
    @tag = Tag.find_by name: tag
    @tag.posts << @post
  end

  @post.save if @post.valid?

  redirect to("/post/#{@post.id}")
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/post/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

# delete
post '/post/:id/delete' do
  @post = Post.find(params[:id])
  Post.delete(@post)

  redirect to('/')
end

put '/post/:id/save' do
  title = params[:title]
  content = params[:content]
  new_tags = params[:tags]

  current_post = Post.find(params[:id])
  current_post[:title] = title
  current_post[:content] = content

  old_tags = PostTag.where(post_id: params[:id])
  old_tags.each {|tag| tag.delete}

  new_tags.each_key do |tag|
    @tag = Tag.find_by name: tag
    @tag.posts << current_post
  end

  current_post.save if current_post.valid?
end