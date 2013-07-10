class User::RegistrationsController < Devise::RegistrationsController
	
	def new
	    super
    end

	def create
		super
		#resource.job = ...
    end

    def destroy
    	super
    end
end