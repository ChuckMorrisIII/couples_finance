Rails.application.routes.draw do
  # Routes for the Account resource:
  # CREATE
  get "/accounts/new", :controller => "accounts", :action => "new"
  post "/create_account", :controller => "accounts", :action => "create"

  # READ
  get "/accounts", :controller => "accounts", :action => "index"
  get "/accounts/:id", :controller => "accounts", :action => "show"

  # UPDATE
  get "/accounts/:id/edit", :controller => "accounts", :action => "edit"
  post "/update_account/:id", :controller => "accounts", :action => "update"

  # DELETE
  get "/delete_account/:id", :controller => "accounts", :action => "destroy"
  #------------------------------

  # Routes for the Transaction resource:
  # CREATE
  get "/transactions/new", :controller => "transactions", :action => "new"
  post "/create_transaction", :controller => "transactions", :action => "create"

  # READ
  get "/transactions", :controller => "transactions", :action => "index"
  get "/transactions/:id", :controller => "transactions", :action => "show"

  # UPDATE
  get "/transactions/:id/edit", :controller => "transactions", :action => "edit"
  post "/update_transaction/:id", :controller => "transactions", :action => "update"

  # DELETE
  get "/delete_transaction/:id", :controller => "transactions", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
