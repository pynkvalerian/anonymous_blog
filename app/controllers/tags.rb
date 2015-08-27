post '/tags' do
  arr = []
  tags = params[:tags]
  tags.each_key do |tag|
    arr << tag
  end
  session[:tags] = arr
  redirect to('/tags')
end

get '/tags' do
  @posts = []

  session[:tags].each do |tag|
    @tag = Tag.find_by(name: tag)
    @tag.posts.each do |post|
      @posts << post
    end
  end

  erb :index
end