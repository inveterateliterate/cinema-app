class Movie < ApplicationRecord
  has_many :showings, dependent: :destroy
  has_many :orders, through: :showings

  validates_presence_of :title, :runtime, :description, :rating

  has_attached_file :image, style: { medium: '300x300', thumb: '60x60' }, default_url: 'https://pixabay.com/static/uploads/photo/2015/11/16/17/39/clouds-1046109_960_720.jpg'
  validates_attachment :image, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }, if: :image?
end