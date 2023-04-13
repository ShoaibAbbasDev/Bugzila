# frozen_string_literal: true

class ConfirmationMailer < ApplicationMailer
  default from: 'syedshoaibabbas786@gmail.com'
  # Ex:- :default =>''
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Please confirm your registration')
  end
end
