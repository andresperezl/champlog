module RecaptchaHelper

	GOOGLE_RECAPTCHA_URI = "https://www.google.com/recaptcha/api/siteverify"

	def verify_recaptcha(response, remoteip, model_options={})
		options = {
			query: {
				secret: ENV["RECAPTCHA_PRIVATE_KEY"],
				response: response,
				remoteip: remoteip
			}
		}
		response = JSON.parse HTTParty.post(GOOGLE_RECAPTCHA_URI, options).body
		success = response["success"]
		unless model_options.empty?
			model = model_options[:record]
			model.errors.add('reCAPTCHA', "the reCAPTCHA test was failed") unless success
		end
		success
	end
end
