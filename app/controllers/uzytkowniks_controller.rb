class UzytkowniksController < ApplicationController
  
  layout 'admin'
  
  before_action :sprawdz_logowanie
  
  def index
    @uzytkownik = Uzytkownik.sortuj
  end

  def nowy
    @uzytkownik = Uzytkownik.new
  end
  
  def utworz
    @uzytkownik = Uzytkownik.new(uzytkownik_parametry)
    if @uzytkownik.save
      flash[:notice] = "Dodano nowego użytkownika."
      redirect_to(:action => 'index')
    else
      render("nowy")
    end
  end

  def edycja
    @uzytkownik = Uzytkownik.find(params[:id])
  end
  
  def aktualizuj
    @uzytkownik = Uzytkownik.find(params[:id])
    if @uzytkownik.update_attributes(uzytkownik_parametry)
      flash[:notice] = "Zaktualizowano użytkownika."
      redirect_to(:action => 'index')
    else
      render("edycja")
    end
  end

  def usun
     @uzytkownik = Uzytkownik.find(params[:id])
  end
  
  def kasuj
    uzytkownik = Uzytkownik.find(params[:id]).destroy
    flash[:notice] = "Użytkownik usuniety."
    redirect_to(:action => 'index')
  end

private

  def uzytkownik_parametry
    params.require(:uzytkownik).permit(:imie, :nazwisko, :email,:uzytkownik, :password, :password_confirmation)
  end
end
