module SurveysHelper
  def convert_response(response)
    if response==1
      'Yes'
    else
      'No'
    end
  end
end
