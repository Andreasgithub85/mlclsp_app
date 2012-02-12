class PagesController < ApplicationController    # PagesController erbt Objekte von ApplicationController
  def home                                   # Definition der Methode home
    @title = "Home"                          # Definition der Instanzvariable @title
  end

  def about
    @title = "About"
  end


end
