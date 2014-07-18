json.array!(@surveys) do |survey|
  json.extract! survey, :id, :response, :user_id, :question_id
  json.url survey_url(survey, format: :json)
end
