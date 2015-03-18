# OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'qGQijnW0aNs3JsJDr3TRIA', 'S17zVTMUnVhKsKIVP6HDioK78aC4Q6u4W8T9kZpDY'
end