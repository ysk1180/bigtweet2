class PostsController < ApplicationController
  before_action :new_post, only: [:show, :new]

  def show
    @hash = params[:id]
    render :new
  end

  def new
  end

  def create
    base64 = to_uploaded(post_params[:picture], filename: "aaaa")
    @post = Post.new(post_params)
    random = post_params[:random]
    generate(base64, random)
    if @post.save
      redirect_to root_path, notice: 'BigTweetありがとうございます！！'
      # redirect_to "https://twitter.com/share?url=https://bigtweet2.herokuapp.com/posts/#{random}&hashtags=BigTweet"
    else
      render :new
    end
  end

  private

  def new_post
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:power, :kind, :picture, :random)
  end

  def to_uploaded(base64_param, filename: )
    content_type, string_data = base64_param.match(/data:(.*?);(?:.*?),(.*)$/).captures
    extention = content_type.split('/').second
    tempfile = Tempfile.new(filename)
    tempfile.binmode
    tempfile << Base64.decode64(string_data)
    tempfile.rewind
    file_param = { filename: [filename, extention].join('.'), type: content_type, tempfile: tempfile }
    ActionDispatch::Http::UploadedFile.new(file_param)
  end

  def generate(image_uri, random)
    storage = Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    )
    case Rails.env
    when 'production'
      bucket = storage.directories.get('bigtweet2-production')
      png_path = 'images/' + random + '.png'
      file = bucket.files.create(key: png_path, public: true, body: open(image_uri))
      @post.picture = 'https://s3-ap-northeast-1.amazonaws.com/bigtweet2-production' + "/" + png_path
    when 'development'
      bucket = storage.directories.get('bigtweet2-development')
      png_path = 'images/' + random + '.png'
      file = bucket.files.create(key: png_path, public: true, body: open(image_uri))
      @post.picture = 'https://s3-ap-northeast-1.amazonaws.com/bigtweet2-development' + "/" + png_path
    end
  end
end
