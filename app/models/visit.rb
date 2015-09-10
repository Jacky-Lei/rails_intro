# == Schema Information
#
# Table name: visits
#
#  id               :integer          not null, primary key
#  shortened_url_id :integer          not null
#  user_id          :integer          not null
#  visit_number     :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Visit < ActiveRecord::Base
  def self.record_visit!(user, shortened_url)
    Visit.create!(shortened_url_id: shortened_url.id, user_id: user.id, visit_number: 1)
  end

  belongs_to :visitor,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :shortened_url,
    class_name: 'ShortenedUrl',
    foreign_key: :shortened_url_id,
    primary_key: :id
end
