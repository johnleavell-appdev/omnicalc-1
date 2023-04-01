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
    # Get the input from params hash
    @apr = params.fetch("apr").to_f
    @number_of_years = params.fetch("number_of_years").to_i
    @principal = params.fetch("principal").to_f

    # Convert APR from string to float and divide by 100 to get percentage
    @monthly_rate = (@apr / 100) / 12

    # Calculate the number of payments
    @n = @number_of_years * 12

    # Calculate the monthly payment using the payment formula
    @payment_numerator = @monthly_rate * @principal
    @payment_denominator = 1 - (1 + @monthly_rate) ** (-@n)
    @monthly_payment = @payment_numerator / @payment_denominator

    # Round the monthly payment to two decimal places
    @monthly_payment = (@monthly_payment * 100).round / 100.0

    # Set the instance variables for the numerator and denominator
    @numerator = @monthly_payment
    @denominator = @n

    # Format the monthly payment as currency
    # Round the monthly payment to two decimal places

    @apr = @apr.to_s(:percentage, precision: 4)
    @principal = @principal.to_s(:currency, unit: "$")
    @monthly_payment = @monthly_payment.to_s(:currency, unit: "$")
    render({ :template => "results/payment_results.html.erb" })
  end
end

