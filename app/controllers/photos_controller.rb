# Kontroler dla zdjęć.
class PhotosController < ApplicationController
  # Filtr pomocniczy dla administracyjnych akcji.
  before_filter :authenticate_admin!, only: [:mark_accepted, :mark_not_accepted]
  before_filter :authenticate_user!, only: [:new, :create]
  # Filtr pomocniczy dla akcji użytkowników.
  # Tylko administrator i użytkownik może ingerować w zdjęcia.
  before_filter :require_permission, only: [:edit, :update, :destroy]
  # Tworzy zmienną photo.
  # Zawiera obiekt zdjęcia zależnie od parametrów photo_params.
  expose(:photo, attributes: :photo_params)
  # Tworzy zmienną accepted_photos.
  # Zawiera wszystkie zaakceptowane zdjęcia.
  expose(:accepted_photos) { Photo.accepted.page(params[:page]) }
  # Tworzy zmienną waiting_photos.
  # Zawiera wszystkie nie zaakceptowane zdjęcia.
  expose(:waiting_photos) { Photo.waiting.page(params[:page]) }
  
  # Akcja index.
  # Wyświetla nam wszystkie zdjęcia które zostały zaakceptowane.
  def index
  end

  # Akcja waiting
  # Wyświetla wszystkie zdjęcia do akceptacji.
  def waiting
  end

  # Akcja show.
  # Wyświetla nam pojedyńcze zdjęcie.
  def show
  end

  # Akcja new.
  # Wyświetla nam formularz dodawania nowego zdjęcia.
  def new
  end

  # Akcja create.
  # Dodaje nam nowe zdjęcie do bazy danych.
  def create
    # Jeżeli użytkownik jest zalogowany.
    # Dodaje go do zdjęcia.
    photo.user = current_user if user_signed_in?
    if photo.save
       redirect_to photo, notice: 'Photo was successfully created.'
    else
       render :new
    end
  end

  # Akcja destroy.
  # Usuwa nam zdjęcie z bazy danych.
  def destroy
    photo.image = nil
    photo.save
    photo.destroy
    # Przekierowuje nas do wszystkich zdjęć (index action)
    redirect_to photos_path
  end

  # Akcja mark_accepted
  # Akceptuje nam zdjęcie i wyświetla komunikat sukcesu.
  def mark_accepted
    photo.accepted!
    redirect_to waiting_photos_path, notice: 'Photo accepted.'
  end

  # Akcja mark_not_accepted
  # Cofa akceptację zdjęcia i wyświetla komunikat sukcesu.
  def mark_not_accepted
    photo.not_accepted!
    redirect_to photos_path, notice: 'Photo not accepted.'
  end
  
  private
  # Metoda pomocnicza
  # Sprawda zakres dostępu każdego użytkownika.
  # Jeżeli nie masz dostępu to przekierowuje cię do głównej strony.
  def require_permission
    return if admin_signed_in? 
    return if current_user and current_user.owner? photo
    redirect_to root_path
  end

  def photo_params
    return if %w{mark_accepted mark_not_accepted}.include? action_name
    params.require(:photo).permit(:image)
  end

end
