class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :subjects, dependent: :destroy 
  
  has_many :favorites
  has_many :answers, through: :favorites
  
  has_many :answers
  has_many :subjects, through: :answers
  
  has_one_attached :profile_image
  
  #find_or_create_byは、データの検索と作成を自動的に判断して処理を行う、Railsのメソッド
  #SecureRandom.urlsafe_base64は、ランダムな文字列を生成するRubyのメソッド
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "guestuser"
    end
  end
  
  # def get_profile_image(width, height)
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   profile_image.variant(resize_to_limit: [width, height]).processed
  # end
  
end
