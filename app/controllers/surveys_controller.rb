class SurveysController < ApplicationController

  # GET /online_surveys
  # GET /online_surveys.json
  def index
    if session[:user_id]
      @surveys = Survey.where(:user_id => session[:user_id])
    else
      @surveys = Survey.all
    end

  end

  # GET /online_surveys/1
  # GET /online_surveys/1.json
  def show
  end

  # GET /online_surveys/new
  def new

    @survey = Survey.new
    @question = Question.find(params[:question_id])

  end

  # GET /online_surveys/1/edit
  def edit
  end

  # POST /online_surveys
  # POST /online_surveys.json
  def create
    survey = survey_params
    if session[:user_id]
      survey_params = survey.merge({:user_id => session[:user_id]})
    else
      survey_params = survey.merge({:user_id => 0})
    end
    @survey = Survey.new(survey_params)

    if @survey.save
      flash[:notice] = "Submitted successfully!"
      redirect_to root_path

    else
      render :json => @survey.errors, :status =>:unprocessable_entity
    end

  end

  # PATCH/PUT /online_surveys/1
  # PATCH/PUT /online_surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, :notice=>'Survey was successfully updated.' }
        format.json { render :show, :status=> :ok, :location => @survey }
      else
        format.html { render :edit }
        format.json { render :json=> @survey.errors, :status=>:unprocessable_entity }
      end
    end
  end

  # DELETE /online_surveys/1
  # DELETE /online_surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, :notice=>'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def survey_params
    params.require(:survey).permit(:response, :user_id, :question_id)
  end

end
