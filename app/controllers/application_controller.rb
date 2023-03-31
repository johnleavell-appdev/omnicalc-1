class ApplicationController < ActionController::Base
  def blank_square_form

    render({ :template => "forms/square_form.html.erb" })
  end

  def blank_square_root_form
    
    render({ :template => "forms/square_root_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("pillow").to_f

    @square_of_num = @num * @num
    render({ :template => "results/square_results.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "results/rand_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "forms/rand_form.html.erb" })
  end

  def blank_payment_form
    render({ :template => "forms/payment_form.html.erb" })
  end

  def square_root_form
 
    @num1 = params.fetch("square_root").to_f
    @square_root_of_num = @num1 ** 0.5

    render({ :template => "forms/square_root_results.html.erb" })
  end
end
