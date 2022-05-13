class SessionsController < ApplicationController

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
   if signed_out
    yield if block_given?
    # respond_to_on_destroy
    redirect_to root_path
  end

  end
  end