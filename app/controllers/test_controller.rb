class TestController < ApplicationController
  layout false

  def index
    #to jest odwołanie do pliku index.html.erb
    @testowa = "witaj w kursie RoR"
    @imiona = ["ala", "ela", "ola"]
    @id = params[:id].to_i
  end
  
  def test
    
    render('test/witaj')
    
  end
  
  def kurs
    
    redirect_to('https://www.onet.pl/')
    
  end
end
