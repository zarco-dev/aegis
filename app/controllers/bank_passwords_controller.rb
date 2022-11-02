class BankPasswordsController < ApplicationController

  def index
    @bankpasswords = policy_scope(BankPassword)

    if params[:query].present?
      @bankpasswords = @bankpasswords.where('account_number LIKE ?', "#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "bank_passwords/parm", locals: {bank_passwords: @bankpasswords}, formats: [:html] }
    end
  end

  def show
    @bankpassword = BankPassword.find(params[:id])
    authorize @bankpassword
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bankpassword = BankPassword.find(params[:id])
    authorize @bankpassword
  end

  def update
    @bankpassword = BankPassword.find(params[:id])
    authorize @bankpassword
    @bankpassword.update(bank_params)
    @bankpassword.save
    redirect_to bank_passwords_path
  end

  def destroy
    @bankpassword = BankPassword.find(params[:id])
    authorize @bankpassword
    @bankpassword.destroy
    redirect_to bank_passwords_path
  end

  private

  def bank_params
    params.require(:bank_password).permit(
      :cardholder,
      :account_type,
      # :bank_name,
      :franchise,
      :account_number,
      :secure_code,
      :expiration_date
    )
  end

end
