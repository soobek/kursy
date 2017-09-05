class PublicController < ApplicationController

  layout 'public'

  def index
    @strona = Strona.where(:widoczna => true).last(3)
    @artykuly = Artykul.where(:widoczna => true).last(3)
    @galerie = Galerie.where(:widoczna => true).last(3)
  end

  def artykuly
    @strona_menu = Strona.where(:widoczna => true).last(10)
  end

  def galerie
    @galeria = Galerie.find(params[:galeria_id])
  end

  def kategorie
    @kategoria = Kategorie.find(params[:kategoria_id])
  end

  def nowosci
    @artykul = Artykul.find(params[:artykul_id])
  end

  def strona
    @strona = Strona.find(params[:strona_id])
  end
end
