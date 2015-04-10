class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy ]

  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

 # def create
     #@profile = Profile.new(profile_params)
     #@profile.save
    # respond_with(@profile)
   #end



def create
  @profile = Profile.new(profile_params)

   if @profile.save

      # Sends email to user when user is created.
      ExampleMailer.sample_email(@profile).deliver
 respond_with(@profile)
     
  end
end







  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end
def import
  Profile.import(params[:file])
  redirect_to root_url, notice: "Profiles imported."
end


 
def export_to_csv       
    @profile = Profile.find(:all)
    csv_string =  Roo::CSV.generate do |csv|
         csv << ["email", "name"]
         @profile.each do |user|
           csv << [profile.email, profile.name]
         end
    end         
  
   send_data csv_string,
   :type => 'text/csv; charset=iso-8859-1; header=present',
   :disposition => "attachment; filename=profiles.csv" 
end




  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:email, :name)
    end

end





