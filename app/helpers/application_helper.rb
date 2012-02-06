module ApplicationHelper

   def title                            # Definition der Methode title
    base_title = "MLCLSP-App"           # Zuweisung der Ausprägung "MLCLSP-App" der Variable base_title
    if @title.nil?                      # boolsche Abfrage der Instanzvariable der Existenz eines Inhalts
      base_title               # Ausgabe der vordefinierten Variable beim fehlenden Inhalt (falls @title.nil? => true)
    else
      "#{base_title} | #{@title}"       # Interpolation der Variablen zu einem String (falls @title.nil? => false)
    end
   end

   def logo
     image_tag("logo.png", :alt => "Sample App", :class =>"round")
   end

end
