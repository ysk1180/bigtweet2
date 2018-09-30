module ApplicationHelper
  def get_twitter_card_info(hash)
    twitter_card = {}
    if hash.present?
      twitter_card[:url] = "https://bigtweet2.herokuapp.com/posts/#{hash}"
      twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/bigtweet2-production/images/#{hash}.png"
    else
      twitter_card[:url] = 'https://bigtweet2.herokuapp.com/'
      twitter_card[:image] = "https://raw.githubusercontent.com/ysk1180/bigtweet2/master/app/assets/images/top.png"
    end
    twitter_card[:title] = "BigTweet〜簡単！画像に文字入りツイート（会員登録不要）"
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:description] = '会員登録不要！10秒で画像に文字入りのツイートをしてみよう！'
    twitter_card
  end
end
