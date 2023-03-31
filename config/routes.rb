Rails.application.routes.draw do
  #square
  get("/square/new", { :controller => "application", :action => "blank_square_form" })
  get("/square/results", { :controller => "application", :action => "calculate_square" })

  #square_root
  get("/square_root/new", { :controller => "application", :action => "blank_square_root_form" })
  get("/square_root/results", { :controller => "application", :action => "calculate_square_root" })

  #random
  get("/random/new", { :controller => "application", :action => "blank_random_form" })
  get("/random/results", { :controller => "application", :action => "calculate_random" })

  #payment
  get("/payment/new", { :controller => "application", :action => "blank_payment_form" })
  get("/payment/results", { :controller => "application", :action => "calculate_payment" })
end
