# Kontroler użytkowników.
class UsersController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :destroy]
  # Zmienna użytkownika o danym id.
  expose(:user) { User.find(params[:id]) }
  # Wszyscy użytkownicy.
  expose(:users) { User.all.page(params[:page]) }
  # Zdjęcia użytkownika.
  expose(:photos) { user.photos.accepted.page(params[:page]) }
  expose(:all_photos) { user.photos.order(:accepted).page(params[:page])} 
  # Akcja index.
  # Wyświetla nam wszystkich użykowników.
  def index
  end

  # Akcja show.
  # Anonimowy - wyświetla wszystkie zdjęcia użytkownika zaapceptowane.
  # Użytkownik lub Admin - wyświetla wszystkie zdjęcia użytkownika.
  #   Posortowne od nie zaakceptowanych.
  def show
    if user == current_user or admin_signed_in?
      self.photos = all_photos
    end
  end

  # Akcja destroy.
  # Usuwa użykownika i przekierowuje do listy użykowników.
  def destroy
    user.destroy
    redirect_to users_path
  end
  private
  def user_params
    params.require(:user)
  end
end
