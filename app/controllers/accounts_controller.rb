class AccountsController < ApplicationController
  
  def search
    
    @account = Account.
      where( :name.matches => params[:account_name]  ).
      where( :account_type => params[:account_type] ).
      first
      
    if @account
      redirect_to show_path( :id => @account.id )
    else
      @account = Account.new( 
        :name => params[:account_name], 
        :account_type => params[:account_type]
      )
      if @account.save
        redirect_to show_path( :id => @account.id )
      else
        flash[:warning] = "Enter valid details"
        redirect_to root_path
      end
    end
    
  end
  
  def show
    @account = Account.find( params[:id] )
  end
  
end
