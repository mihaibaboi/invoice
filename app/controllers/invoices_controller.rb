class InvoicesController < ApplicationController
  
  before_filter :confirm_logged_in
  
  def index
    @invoices = Invoice.where('user_id = ?', params[:user_id])
  end
    
  def show
    begin
      @invoice = Invoice.find(params[:id])
    rescue
      @invoice = nil
    end
  end
      
  def new
    @invoice = Invoice.new
  end
  
  def destroy
  end
end
