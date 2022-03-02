class Project < ApplicationRecord
  has_one_attached :ProjectCover
  validates :TypeID, presence: true
  has_many :display_lines
  has_many :contributions, through: :display_lines

  # From https://stackoverflow.com/questions/36038646/string-interpolation-to-external-link-without-http
  # For Input Sanitization
  def ProjectLink=(url)
    if url.present?
      url = url.match(/https?:\/\//) ? url : "http://#{url}"
      write_attribute(:ProjectLink, url)
    end
  end
  
end
