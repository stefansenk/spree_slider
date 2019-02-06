class Spree::Slide < ActiveRecord::Base

  has_and_belongs_to_many :slide_locations,
                          class_name: 'Spree::SlideLocation',
                          join_table: 'spree_slide_slide_locations'

  # has_attached_file :image,
  #                   url: '/spree/slides/:id/:style/:basename.:extension',
  #                   path: ':rails_root/public/spree/slides/:id/:style/:basename.:extension',
  #                   convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  # validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


  has_one_attached :image
  validate :check_attachment_content_type

  def accepted_image_types
    %w(image/jpeg image/jpg image/png image/gif)
  end

  def check_attachment_content_type
    if image.attached? && !image.content_type.in?(accepted_image_types)
      errors.add(:image, :not_allowed_content_type)
    end
  end



  scope :published, -> { where(published: true).order('position ASC') }
  scope :location, -> (location) { joins(:slide_locations).where('spree_slide_locations.name = ?', location) }

  belongs_to :product, touch: true, required: false

  def initialize(attrs = nil)
    attrs ||= { published: true }
    super
  end

  def slide_name
    name.blank? && product.present? ? product.name : name
  end

  def slide_link
    link_url.blank? && product.present? ? product : link_url
  end

  def slide_image
    !image.attached? && product.present? && product.images.any? ? product.images.first.attachment : image
  end

end
