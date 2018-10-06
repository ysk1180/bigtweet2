class PostsController < ApplicationController
  def new
    @hash = params[:h]
    @post = Post.new
  end

  def make
    generate(to_uploaded(params[:imgData]), params[:hash])
    data = []
    render :json => data
  end

  private

  def to_uploaded(base64_param)
    content_type, string_data = base64_param.match(/data:(.*?);(?:.*?),(.*)$/).captures
    tempfile = Tempfile.new
    tempfile.binmode
    tempfile << Base64.decode64(string_data)
    file_param = { type: content_type, tempfile: tempfile }
    ActionDispatch::Http::UploadedFile.new(file_param)
  end

  def generate(image_uri, hash)
    storage = Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    )
    case Rails.env
    when 'production'
      bucket = storage.directories.get('bigtweet2-production')
      png_path = 'images/' + hash + '.png'
      bucket.files.create(key: png_path, public: true, body: open(image_uri))
    when 'development'
      bucket = storage.directories.get('bigtweet2-development')
      png_path = 'images/' + hash + '.png'
      bucket.files.create(key: png_path, public: true, body: open(image_uri))
    end
  end
end
