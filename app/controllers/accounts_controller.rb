class AccountsController < ApplicationController
  before_action :current_user_must_be_account_owner, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_account_owner
    account = Account.find(params[:id])

    unless current_user == account.owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @accounts = current_user.accounts.page(params[:page]).per(10)

    render("accounts/index.html.erb")
  end

  def show
    @transaction = Transaction.new
    @account = Account.find(params[:id])

    render("accounts/show.html.erb")
  end

  def new
    @account = Account.new

    render("accounts/new.html.erb")
  end

  def create
    @account = Account.new

    @account.name = params[:name]
    @account.account_type = params[:account_type]
    @account.owner_id = params[:owner_id]
    @account.account_subtype = params[:account_subtype]
    @account.joint_owner_id = params[:joint_owner_id]

    save_status = @account.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accounts/new", "/create_account"
        redirect_to("/accounts")
      else
        redirect_back(:fallback_location => "/", :notice => "Account created successfully.")
      end
    else
      render("accounts/new.html.erb")
    end
  end

  def edit
    @account = Account.find(params[:id])

    render("accounts/edit.html.erb")
  end

  def update
    @account = Account.find(params[:id])

    @account.name = params[:name]
    @account.account_type = params[:account_type]
    @account.owner_id = params[:owner_id]
    @account.account_subtype = params[:account_subtype]
    @account.joint_owner_id = params[:joint_owner_id]

    save_status = @account.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accounts/#{@account.id}/edit", "/update_account"
        redirect_to("/accounts/#{@account.id}", :notice => "Account updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Account updated successfully.")
      end
    else
      render("accounts/edit.html.erb")
    end
  end

  def destroy
    @account = Account.find(params[:id])

    @account.destroy

    if URI(request.referer).path == "/accounts/#{@account.id}"
      redirect_to("/", :notice => "Account deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Account deleted.")
    end
  end
end
