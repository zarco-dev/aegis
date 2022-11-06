class Password < ApplicationRecord
  before_create :linkimg
  belongs_to :user
  belongs_to :group, optional: true

  validates :url, presence: true
  validates :site_name, :site_username, :site_password, presence: true


  private

  def linkimg
    newurl = self.url
    imgurl = newurl.scan(/\A(https:\/\/(\w*|\d*)\.*(\w*|\d*)\.(com|co|tech|com.co|online))\/*/)
    if imgurl.empty?
      self.category = "https://i.imgur.com/hPTdOQ4.png"
    else
      imgurl = imgurl[0][0].gsub(imgurl[0][0], "#{imgurl[0][0]}/favicon.ico")
      self.category = imgurl
    end
  end

end
