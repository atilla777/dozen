class User < ApplicationRecord
  acts_as_authentic do |c|
    #c.login_field = :email
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
    c.perishable_token_valid_for = 10.minutes
    c.validates_format_of_email_field_options = {:with => Authlogic::Regex.email_nonascii}
    c.merge_validates_format_of_email_field_options message: 'should to be an email address format'
    c.merge_validates_uniqueness_of_email_field_options# if: :active
    #condition = proc do
    #  (password.present? || password_confirmation.present?) ||
    #  (new_record? && active) ||
    #  (crypted_password.blank? && active)
    #end
    #c.merge_validates_length_of_password_field_options minimum: 6, if: condition
    #c.merge_validates_confirmation_of_password_field_options if: condition
    #c.merge_validates_length_of_password_confirmation_field_options if: condition
    #c.merge_validates_format_of_email_field_options if: condition
    c.merge_validates_length_of_password_field_options minimum: 6
    c.merge_validates_confirmation_of_password_field_options
  end

  validates :email, uniqueness: true
  validates :firstname, length: {maximum: 255}
  validates :lastname, length: {maximum: 255}
  #validates :email, format: /\A.+@.+\..+\z/i

  has_many :dictionaries

  def show_name
    if firstname.present? || lastname.present?
      [firstname, lastname].join(' ')
    else
      email
    end
  end

  def activate!
    self.update(active: true, confirmed: true, approved: true)
  end
end

