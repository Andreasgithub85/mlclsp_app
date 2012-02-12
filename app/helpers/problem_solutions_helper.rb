module ProblemSolutionsHelper

  def objective_function_value_response
    if @objective_function_value.nil?
      return "No objective value is available!"
    else
      return "objective value is "+@objective_function_value + "!"
    end
  end



end


