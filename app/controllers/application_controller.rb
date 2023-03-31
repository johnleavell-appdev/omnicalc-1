class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "forms/square_form.html.erb" })
  end

  def blank_square_root_form
    render({ :template => "forms/square_root_form.html.erb" })
  end

  def blank_random_form
    render({ :template => "forms/rand_form.html.erb" })
  end

  def blank_payment_form
    render({ :template => "forms/payment_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("pillow").to_f

    @square_of_num = @num * @num
    render({ :template => "results/square_results.html.erb" })
  end

  def calculate_square_root
    @num1 = params.fetch("square_root").to_f
    @square_root_of_num1 = @num1 ** 0.5

    render({ :template => "results/square_root_results.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "results/rand_results.html.erb" })
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f
    @number_of_years = params.fetch("number_of_years")
    @principal = params.fetch("principal")

    render({ :template => "results/payment_results.html.erb" })
  end
end
