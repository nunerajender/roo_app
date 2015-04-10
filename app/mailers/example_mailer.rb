class ExampleMailer < ApplicationMailer
  default from: 'pathakorama1@gmail.com'

  def sample_email(profile)
    @profile = profile

    mail(to: @profile.email, subject: 'Sample Email')
  end

end
