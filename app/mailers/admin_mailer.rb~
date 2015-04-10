class AdminMailer < ApplicationMailer
 default from: 'pathakorama1@gmail.com'




def csv_mail(page, csv_data)
    attachments['a.csv'] = csv_data  
    mail(to: @page.email, subject: 'Sample Email')

end


#def welcome(recipient)
    #attachments['free_book.pdf'] = File.read('path/to/file.pdf')
   # mail(:to => recipient, :subject => "New account information")
  #end



# def sample_email(page)

    #@page = page

   # mail(to: @page.email, subject: 'Sample Email')
  #end


end
