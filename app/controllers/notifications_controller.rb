class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all.order(updated_at: :desc)
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create    
    @notification = Notification.new(notification_params)
    authorize(Notification)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'News successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { redirect_to @notification, notice: 'News NOT created.' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    authorize(Notification)
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'News successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    authorize(Notification)
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'News successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find_by(id: params[:id])
      unless @notification
        respond_to do |format|
          format.html { redirect_to notifications_url, alert: 'News Does not exist' }
          format.json { head :no_content }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:title, :body, :flyer)
    end
end
