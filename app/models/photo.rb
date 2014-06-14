# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  accepted           :boolean          default(FALSE), not null
#  user_id            :integer
#
# Indexes
#
#  index_photos_on_user_id  (user_id)
#

class Photo < ActiveRecord::Base
  # Zdjęcie należy do użytkownika.
  belongs_to :user
 
  # Konfiguracja dla załączników paperclip'a

  # Rozmiary dla miniaturek.
  has_attached_file :image,
    styles: { default: '200x200#' }
  # Plik może byś tylko zdjęciem.
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # Przy wysyłaniu musi być podany plik,
  # oraz nie może być większy niż 10 mega.
  validates_attachment :image,
    :presence => true,
    :size => { :in => 0..10.megabytes }

  # Zakresy pomocnicze.
  scope :accepted, -> { where(accepted: true).order('created_at DESC') }
  scope :waiting, -> { where(accepted: false).order('created_at DESC') }

  # Metody pomocnicze dla modelu.

  # Zaakceptuj zdjęcie.
  def accepted!
    update_attribute(:accepted, true)
  end

  # Nie akceptuj zdjęcia.
  def not_accepted!
    update_attribute(:accepted, false)
  end

end
