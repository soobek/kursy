class ArtykulsController < ApplicationController
 layout 'admin'

  before_action :sprawdz_logowanie
  before_action :szukaj_strone

  def index
    @artykuly = @strony.artykuls.sortuj
  end

  def pokaz
    @artykuly = Artykul.find(params[:id])
  end

  def edycja
    @artykuly = Artykul.find(params[:id])
    @strona = Strona.order('pozycja ASC')
    @licznik = Artykul.count
  end
  
  def aktualizuj
    @artykuly = Artykul.find(params[:id])
    if @artykuly.update_attributes(artykul_parametry)
      flash[:notice] = "Artykuł został pomyślnie zmodyfikowany."
      redirect_to(:action => 'pokaz', :id => @artykuly.id, :strona_id => @strony.id)
    else
      @licznik = Artykul.count
      @strona = Strona.order('pozycja ASC')
      render('edycja')
    end
  end

  def nowy
   @artykuly = Artykul.new({:nazwa => "Tyluł?", :strona_id => @strony.id})
   # @strona = Strona.order('pozycja ASC')
   @strona = @strony.kategorie.stronas.sortuj
   @licznik = Artykul.count + 1
  end

  def utworz
    @artykuly = Artykul.new(artykul_parametry)
    if @artykuly.save
      flash[:notice] = "Artykuł został pomyślnie utworzony."
      redirect_to(:action => 'index', :strona_id => @strony.id)
    else
      @licznik = Artykul.count + 1
      @strona = Strona.order('pozycja ASC')
      render('nowy')
    end
  end
  
  def usun
    @artykuly = Artykul.find(params[:id])
  end
  def kasuj
      artykul = Artykul.find(params[:id]).destroy
      flash[:notice] = "Artykul '#{artykul.nazwa}' został pomyślnie usunięty."
      redirect_to(:action => 'index', :strona_id => @strony.id)
  end
  
  
private

  def szukaj_strone
    if params[:strona_id]
      @strony = Strona.find(params[:strona_id])
    end
  end
  def artykul_parametry
    params.require(:artykuly).permit(:strona_id, :nazwa, :pozycja, :widoczny, :created_at, :zdjecie, :zawartosc)
  end
end
