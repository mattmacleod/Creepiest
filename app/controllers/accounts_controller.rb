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
        @account.sync unless Rails.env=="test"
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
  
  def locations
    @account = Account.find( params[:id] )
    render :json => @account.locations.order(:location_time).to_json
  end
  
end
