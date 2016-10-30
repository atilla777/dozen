class User < ApplicationRecord
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
    c.merge_validates_format_of_email_field_options message: 'должно быть адресом электронной почты'
    c.merge_validates_uniqueness_of_email_field_options if: :active
    condition = proc do
      (password.present? || password_confirmation.present?) ||
      (new_record? && active) ||
      (crypted_password.blank? && active)
    end
    c.merge_validates_length_of_password_field_options minimum: 6, if: condition
    c.merge_validates_confirmation_of_password_field_options if: condition
    c.merge_validates_length_of_password_confirmation_field_options if: condition
    c.merge_validates_format_of_email_field_options if: condition
  end

  validates :email, uniqueness: {allow_blank: true}
  validates :email, format: /\A.+@.+\..+\z/i
end

