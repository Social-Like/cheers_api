class Attachment < ActiveRecord::Base
  attr_accessible :prioriry, :asset, :attachmentable_id, :attachmentable_type

  # paperclip
  has_attached_file :asset, styles: {thumb: "100x100#", list: "217"}

  # relations
  belongs_to :attachmentable, polymorphic: true

  validates :asset, attachment_presence: true

  delegate :url, :path, :content_type, :original_file_name, :size, :to => :asset

  HOST = "http://localhost:3000"

  def list
    HOST + url(:list, false)
  end
end
