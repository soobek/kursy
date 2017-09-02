class DostepController < ApplicationController

  layout "admin"

  before_action :sprawdz_logowanie, :except => [:login, :logowanie, :logout]

  def index
  end

  def login
    @uzytkownik = Uzytkownik.find_by imie:'Lech'
  end

  def logowanie

    if params[:uzytkownik].present? && params[:haslo].present?
      admin_szukam = Uzytkownik.where(:uzytkownik => params[:uzytkownik]).first
      if admin_szukam
        admin_autoryzacja = admin_szukam.authenticate(params[:haslo])
      end
    end

    if admin_autoryzacja
      session[:uzytkownik_id] = admin_autoryzacja.id
      session[:uzytkownik] = admin_autoryzacja.uzytkownik
      flash[:notice] = "Zostałeś poprawnie zalogowany."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "błąd: niepoprawna nazwa użytkownika lub hasło."
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:uzytkownik_id] = nil
    session[:uzytkownik] = nil
    flash[:notice] = "Zostałeś wylogowany"
    redirect_to(:action => "login")
  end
end
