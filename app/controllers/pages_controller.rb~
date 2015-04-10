class PagesController < ApplicationController

def import
  
   Page.import(params[:file])

  redirect_to root_url, notice: "Pages imported."

end


def create
  @page =  Page.new(page_params)

   if @page.save

      # Sends email to user when user is created.
      Admin.Mailer.sample_email(@page).deliver
 

     AdminMailer.csv_mail(@page, @csv_data).deliver

respond_with(@page)

  end
end


end
