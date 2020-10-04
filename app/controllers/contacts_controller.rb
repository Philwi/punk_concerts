class ContactsController < ApplicationController
  def new
    run Contact::Operation::Create::Present
    render html: cell(::Contact::Cell::New, @form), layout: 'application'
  end

  def create
    result = Contact::Operation::Create.(params: params, recaptcha: verify_recaptcha)
    flash = Contact::Operation::Create::Flash.(result)

    if result.success?
      redirect_to shows_path
    else
      render html: cell(Contact::Cell::New, result[:'contract.default']), layout: 'application'
    end
  end
end