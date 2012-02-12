class ProblemSolutionsController < ApplicationController

  def index
    @title = "Data Input & Solution"
  end


def optimize

    if File.exist?("MLCLSP_Input_Instanz1.inc")
      File.delete("MLCLSP_Input_Instanz1.inc")
    end
    f=File.new("MLCLSP_Input_Instanz1.inc", "w")           #"w" für write
    printf(f, "Set k / \n")
    @products = Product.find(:all)
    @products.each { |so| printf(f, "k" + so.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "t / \n")
    @periods = Period.find(:all)
    @periods.each { |si| printf(f, "t" + si.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @resources = Resource.find(:all)
    @resources.each { |li| printf(f, "j" + li.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "alias(k,i); \n")

    printf(f, "Set NF(k,i);\n")
    printf(f, "NF(k,i) = no;\n")
    @follower_products = FollowerProduct.find(:all)
    @follower_products.each do |nf|
      printf(f, "NF( 'k" + nf.follower_id.to_s + "', 'k" + nf.product_id.to_s + "') = yes;\n")
    end

    printf(f, "Set PR(k,j);\n")
    printf(f, "PR(k,j) = no;\n")
    @products.each do |pr|
      printf(f, "PR( 'k" + pr.id.to_s + "', 'j" + pr.resource.to_s + "') = yes;\n")
    end

    printf(f, "\n\n")

    printf(f, "Parameters\n  h(k) /\n")
    @products.each { |so| printf(f, "k" + so.id.to_s + "  " + so.storage_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\n s(k) /\n")
    @products.each { |si| printf(f, "k" + si.id.to_s + "  " + si.setup_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\n tb(k) /\n")
    @products.each { |li| printf(f, "k" + li.id.to_s + "  " + li.working_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\n tr(k) /\n")
    @products.each { |li| printf(f, "k" + li.id.to_s + "  " + li.setup_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\n z(k) /\n")
    @products.each { |li| printf(f, "k" + li.id.to_s + "  " + li.leadtime_shift.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\n y0(k) /\n")
    @products.each { |li| printf(f, "k" + li.id.to_s + "  " + li.start_inventory.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\n")

    printf(f, "a(k,i) /\n")
    @follower_products.each { |li|
    printf(f, "k" + li.product_id.to_s + ".k" + li.follower_id.to_s + " " + li.coefficient.to_s + "\n")}
    printf(f, "/" + "\n\n")

    printf(f, "b(j,t) /\n")
    @resource_periods = ResourcePeriod.find(:all)
    @resource_periods.each { |li|
    printf(f, "j" + li.resource_id.to_s + ".t" + li.period_id.to_s + " " + li.capacity.to_s + "\n")}
    printf(f, "/" + "\n\n")

    printf(f, "d(k,t) /\n")
    @demands = Demand.find(:all)
    @demands.each { |li|
    printf(f, "k" + li.product_id.to_s + ".t" + li.period_id.to_s + " " + li.demand_quantity.to_s + "\n")}
    printf(f, "/;" + "\n\n")

    printf(f, "Scalar M; \n")
    printf(f, "M = 100000; \n")

    f.close


    #if File.exist?("mlclsp_solution.txt")                # hier steht Lsg drin
    #  File.delete("mlclsp_solution.txt")
    #end


    system "gams mlclsp"      # GAMS-Einbindung

    #@transport_links = TransportLink.find(:all)
    render :template => "problem_solutions/index"

    end

    def read_production_inventory_quantities

    @problemsolution=ProblemSolution.all
    @problemsolution.each {|problemsolution|
    problemsolution.destroy}

    fi=File.open("mlclsp_solution1.txt", "r")
    fi.each { |line| # printf(f,line)
      sa=line.split(";")
      sa0=sa[0].delete "k "
      sa1=sa[1].delete "t "
      sa2=sa[2].delete " "

      @problem_solution=ProblemSolution.new
      @problem_solution.product_name=sa0
      @problem_solution.period_name=sa1
      @problem_solution.production_quantity=sa2
      @problem_solution.save
    }

   fi.close

    @inventorysolution=InventorySolution.all
    @inventorysolution.each {|problemsolution|
    problemsolution.destroy}

    fi=File.open("mlclsp_solution2.txt", "r")
    fi.each { |line| # printf(f,line)
      sa=line.split(";")
      sa0=sa[0].delete "k "
      sa1=sa[1].delete "t "
      sa2=sa[2].delete " "

      @inventory_solution=InventorySolution.new
      @inventory_solution.product_name=sa0
      @inventory_solution.period_name=sa1
      @inventory_solution.inventory=sa2
      @inventory_solution.save
    }

   fi.close

    #@transport_links = TransportLink.find(:all)
    render :template => "problem_solutions/index"

    end




  def delete_production_quantities
   @problem_solutions = ProblemSolution.all
   @problem_solutions.each { |li|
   li.production_quantity=0.0
   li.save
   }

   @inventory_solutions = InventorySolution.all
   @inventory_solutions.each { |li|
   li.inventory=0.0
   li.save
   }

   render :template => "problem_solutions/index"
  end

   def read_and_show_ofv
     if File.exist?("ofv.txt")
       fi=File.open("ofv.txt", "r")
       line=fi.readline
       fi.close
       sa=line.split(" ")
       @objective_function_value=sa[1]
     else
       @objective_function_value=nil
     end

      #@problem_solution = ProblemSolution.find(:all)
     render :template => "problem_solutions/index"
   end




end

