class ArtykulsController < ApplicationController
 layout 'admin'

  def index
    @artykuly = Artykul.sortuj
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
      redirect_to(:action => 'pokaz', :id => @artykuly.id)
    else
      @licznik = Artykul.count
      @strona = Strona.order('pozycja ASC')
      render('edycja')
    end
  end

  def nowy
   @artykuly = Artykul.new({:nazwa => "Tyluł?"})
   @strona = Strona.order('pozycja ASC')
   @licznik = Artykul.count + 1
  end

  def utworz
    @artykuly = Artykul.new(artykul_parametry)
    if @artykuly.save
      flash[:notice] = "Artykuł został pomyślnie utworzony."
      redirect_to(:action => 'index')
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
      redirect_to(:action => 'index')
  end
  
  def artykul_parametry
    params.require(:artykuly).permit(:strona_id, :nazwa, :pozycja, :widoczny, :created_at, :zdjecie, :zawartosc)
  end
end
