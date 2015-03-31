
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		auth = request.env["omniauth.auth"]
		#raise auth.to_yaml
		data = {
			nombre: auth.info.first_name,
			apellido: auth.info.last_name,
			username: auth.info.nickname,
			correo: auth.info.email,
			provider: auth.provider, 
			uid: auth.uid
		}
		
		@user = User.find_or_create_by_omniauth(data)

		if @user.persisted?
			sign_in_and_redirect @user, event: :autentication
		else
			session[:omniauth_errors] = @user.errors.full_messages.to_sentence unless @user.save
			session[:facebook_data] = data
			redirect_to new_user_registration_path
		end
	end
end
