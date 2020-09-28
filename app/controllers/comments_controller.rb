class CommentsController < ApplicationController

  def create
    result = ::Comment::Operation::Create.(params: params, recaptcha: verify_recaptcha)
    redirect_to show_path(result[:show].id)
  end
end
