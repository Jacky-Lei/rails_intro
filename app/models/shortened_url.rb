# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  short_url    :string           not null
#  long_url     :string           not null
#  submitter_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, presence: true

  def self.random_code
    generated_code = SecureRandom.urlsafe_base64

    while ShortenedUrl.all.exists?(generated_code)
      generated_code = SecureRandom.urlsafe_base64
    end
      generated_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(short_url: self.random_code, long_url: long_url, submitter_id: user.id)
  end

  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :submitter_id,
    primary_key: :id

  has_many :visits,
    class_name: 'Visit',
    foreign_key: :shortened_url_id,
    primary_key: :id

  has_many :visitors, :through => :visits, :source => :visitor

  def num_clicks
    self.count
  end

end
