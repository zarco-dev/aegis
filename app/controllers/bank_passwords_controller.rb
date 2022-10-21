class BankPasswordsController < ApplicationController

  def index
    @bankpasswords = policy_scope(BankPassword)
  end

  def new
    @bankpassword = BankPassword.new
    authorize @bankpassword
  end

  def create
    @bankpassword = BankPassword.new(bank_params)
    @bankpassword.user = current_user
    authorize @bankpassword
    if @bankpassword.save
      redirect_to bank_passwords_path
    else
      render :new
    end
  end

  private

  def bank_params
    params.require(:bank_password).permit(
      :cardholder,
      :account_type,
      :bank_name,
      :franchise,
      :account_number,
      :secure_code,
      :expiration_date
    )
  end

end
