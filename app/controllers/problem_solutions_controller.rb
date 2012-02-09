class ProblemSolutionsController < ApplicationController
  def index
  end

end

def optimize

    if File.exist?("MLCLSP_Input_Instanz1.inc")
      File.delete("MLCLSP_Input_Instanz1.inc")
    end
    f=File.new("MLCLSP_Input_Instanz1.inc", "w")           #"w" für write
    printf(f, "set k / \n")
    @products = Product.find(:all)
    @products.each { |so| printf(f, "k" + so.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "t / \n")
    @demands = Demand.find(:all)
    @demands.each { |si| printf(f, "t" + si.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @resources = Resource.find(:all)
    @resources.each { |li| printf(f, "j" + li.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "alias(k,i); \n")
    printf(f, "NF(k,i) = no;\n")
    #printf(f, "LJ(l,j) = no;\n\n")

    @dependencies.each do |nf|
      printf(f, "NF( 'k" + nf.product_name.to_s + "', 'i" + nf.follower.to_s + "') = yes;\n")
      #printf(f, "LJ( 'l" + li.id.to_s + "', 'j" + li.sink_id.to_s + "') = yes;\n\n")
    end

    printf(f, "PR(k,j) = no;\n")
    @products.each do |pr|
      printf(f, "PR( 'k" + pr.product_name.to_s + "', 'j" + pr.resource.to_s + "') = yes;\n")
    end

    printf(f, "\n\n")

    printf(f, "Parameter\n  A(i) /\n")

    @sources.each { |so| printf(f, "i" + so.id.to_s + "  " + so.supply_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nN(j) /\n")

    @sinks.each { |si| printf(f, "j" + si.id.to_s + "  " + si.demand_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nc(l) /\n")

    @transport_links.each { |li| printf(f, "l" + li.id.to_s + "  " + li.unit_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, ";\n")
    f.close


    if File.exist?("Transportmengen_v2.txt")                # hier steht Lsg drin
      File.delete("Transportmengen_v2.txt")
    end


    system "gams Transportmodell_v2"      # GAMS-Einbindung

    @transport_links = TransportLink.find(:all)
    render :template => "transport_links/index"

    end

    def read_transportation_quantities



    fi=File.open("Transportmengen_v2.txt", "r")
    fi.each { |line| # printf(f,line)
      sa=line.split(";")
      sa0=sa[0].delete "l "
      sa3=sa[3].delete " \n"
      al=TransportLink.find_by_id(sa0)
      al.transport_quantity=sa3
      al.save

    }

    fi.close


    @transport_links = TransportLink.find(:all)
    render :template => "transport_links/index"

  end

