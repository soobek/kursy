class StronasController < ApplicationController
 layout 'admin'
 
  def index
    
    @stronas = Strona.sortuj
    
    
  end

  def pokaz
  end

  def nowa
    @licznik = Strona.count + 1
    @kategoria = Kategorie.order('pozycja ASC')
  end

  def utworz
    @strona = Strona.new(strona_parametry)
    if @strona.save
      flash[:notice] = "Strona została pomyślnie utworzona."
      redirect_to(:action => 'index')
    else
      @licznik = Strona.count + 1
      @kategoria = Kategorie.order('pozycja ASC')
      render('nowa')
    end
  end
  
  def edycja
  end

  def usun
  end
  
  def strona_parametry
    params.require(:strona).permit(:kategorie_id, :nazwa, :pozycja, :widoczna, :created_at)
  end
end
