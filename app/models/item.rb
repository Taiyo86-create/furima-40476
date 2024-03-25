class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :category_id, numericality: { other_than: 1 }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :schedule
  has_many_attached :images


  validates :itemsName, presence: true
  validates :itemsFeature, presence: true
  validates :price, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validate :price_must_be_integer

  def price_must_be_integer
    if price.present? && !price.to_s.match(/\A[0-9]+\z/)
      errors.add(:price, "must be a valid integer")
    end
  end

  validates :image, presence: true


  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :schedule_id, numericality: { other_than: 1 }


  def image_url=(url)
    begin
      self.image.attach(io: open(url), filename: File.basename(url))
    rescue OpenURI::HTTPError => e
      errors.add(:image_url, "Could not download image from #{url}: #{e.message}")
    end
  end

end
