class Link < ActiveRecord::Base
  validates :short_url, uniqueness: true


  def self.handle_redirection shortlink
    where(short_url: shortlink).first
  end

  def self.random_url size=3
    chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    random = ''
    size.times { |i| random << chars[rand(chars.length)] }
    random
  end

  def self.check_http original_url
    if !(original_url.include? 'http://')
      original_url = 'http://' + original_url
    end
    original_url
  end

  def self.original_url_exists? original_url
    where(original_url: original_url).first
  end

end
