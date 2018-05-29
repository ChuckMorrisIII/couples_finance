class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all

    render("transactions/index.html.erb")
  end

  def show
    @tagging = Tagging.new
    @transaction = Transaction.find(params[:id])

    render("transactions/show.html.erb")
  end

  def new
    @transaction = Transaction.new

    render("transactions/new.html.erb")
  end

  def create
    @transaction = Transaction.new

    @transaction.amount = params[:amount]
    @transaction.trasaction_type = params[:trasaction_type]
    @transaction.category_id = params[:category_id]
    @transaction.date = params[:date]
    @transaction.description = params[:description]
    @transaction.account_id = params[:account_id]
    @transaction.tagging_id = params[:tagging_id]

    save_status = @transaction.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/transactions/new", "/create_transaction"
        redirect_to("/transactions")
      else
        redirect_back(:fallback_location => "/", :notice => "Transaction created successfully.")
      end
    else
      render("transactions/new.html.erb")
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])

    render("transactions/edit.html.erb")
  end

  def update
    @transaction = Transaction.find(params[:id])

    @transaction.amount = params[:amount]
    @transaction.trasaction_type = params[:trasaction_type]
    @transaction.category_id = params[:category_id]
    @transaction.date = params[:date]
    @transaction.description = params[:description]
    @transaction.account_id = params[:account_id]
    @transaction.tagging_id = params[:tagging_id]

    save_status = @transaction.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/transactions/#{@transaction.id}/edit", "/update_transaction"
        redirect_to("/transactions/#{@transaction.id}", :notice => "Transaction updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Transaction updated successfully.")
      end
    else
      render("transactions/edit.html.erb")
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])

    @transaction.destroy

    if URI(request.referer).path == "/transactions/#{@transaction.id}"
      redirect_to("/", :notice => "Transaction deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Transaction deleted.")
    end
  end
end
