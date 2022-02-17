class UserSessionsController < ApplicationController
    skip_before_action :authenticate_user!

    layout 'log'

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:notice]="Authentification réussie"
            Rails.logger.info "Authentification réussie"
            Rails.logger.info session.to_hash
            redirect_to '/'#, token: user.auth_token
        else
            flash[:notice]="Email ou mot de passe invalide"
            Rail.logger.info "Email ou mot de passe invalide"
            redirect_to '/login'
        end
    end
    def destroy
        session[:user_id] = nil
        flash[:notice]="Déconnecté"
        redirect_to '/login'
  end
  end
