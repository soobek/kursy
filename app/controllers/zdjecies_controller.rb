class ZdjeciesController < ApplicationController
  
  layout 'admin'

  before_action :sprawdz_logowanie
  before_action :szukaj_galerie

  def index
    @zdjecia = @galerie.zdjecies.sortuj
  end

  def nowe
    @zdjecia = Zdjecie.new({:nazwa => "Podaj nazwę", :galerie_id => @galerie.id})
    @licznik = Zdjecie.count + 1
    @galeria = Galerie.order('pozycja ASC')
  end
  
  def utworz
    @zdjecia = Zdjecie.new(zdjecia_parametry)
    if @zdjecia.save
        flash[:notice] = "Utworzono nowe zdjęcie."
        redirect_to({:action => 'index', :galerie_id => @galerie.id})
    else
      @licznik = Zdjecie.count + 1
      @galeria = Galerie.order('pozycja ASC')
    end
  end

  def pokaz
    @zdjecia = Zdjecie.find(params[:id])
  end

  def edycja
    @zdjecia = Zdjecie.find(params[:id])
    @licznik = Zdjecie.count
    @galeria = Galerie.order('pozycja ASC')
  end
  
  def aktualizuj
     @zdjecia = Zdjecie.find(params[:id])
    if @zdjecia.update_attributes(zdjecia_parametry)
      flash[:notice] = "Zdjęcie zostało zedytowane."
      redirect_to(:action => 'pokaz', :id => @zdjecia.id, :galerie_id => @galerie.id)
    else
      @licznik = Zdjecie.count
      @galeria = Galerie.order('pozycja ASC')
    end
  end

  def usun
    @zdjecia = Zdjecie.find(params[:id])
  end
  def kasuj
    zdjecia = Zdjecie.find(params[:id]).destroy
    flash[:notice] = "Zdjęcie zostało usunięte."
    redirect_to(:action => 'index', :galerie_id => @galerie.id)
  end
private
  def szukaj_galerie
    if params[:galerie_id]
      @galerie = Galerie.find(params[:galerie_id])
    end
  end

  def zdjecia_parametry
    params.require(:zdjecia).permit(:galerie_id, :nazwa, :pozycja, :widoczne, :zdjecie, :created_at, :opis)  
  end
  
end
