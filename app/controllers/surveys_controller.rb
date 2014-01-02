class SurveysController < ApplicationController

	def index
		@user = current_user
		@survey = Survey.new
	end
	def show
		@user = current_user
		@survey = Survey.new
		@user.save
	end
	def create
		if(user_signed_in? && !current_user.employer)
			@user = current_user
			@survey = Survey.new(survey_params)
			@survey.user_id = @user.user_id
			@survey.save
			if(@survey.question1 == 1)
				$skill1 = Skill.new()
				$skill1.label = "Leadership"
				$skill1.user_id = @user.user_id
				$skill1.save
			else
				$skill1 = Skill.new()
				$skill1.label = "Taking Instruction"
				$skill1.user_id = @user.user_id
				$skill1.save
			end
			if(@survey.question2 == 1)
				$skill2 = Skill.new()
				$skill2.label = "Teamwork"
				$skill2.user_id = @user.user_id
				$skill2.save
			else
				$skill2 = Skill.new()
				$skill2.label = "Working Independently"
				$skill2.user_id = @user.user_id
				$skill2.save
			end
			if(@survey.question3 == 1)
				$skill3 = Skill.new()
				$skill3.label = "First aid Training"
				$skill3.user_id = @user.user_id
				$skill3.save
			else
				$skill3 = Skill.new()
				$skill3.label = "Willingness to learn"
				$skill3.user_id = @user.user_id
				$skill3.save
			end
			if(@survey.question4 == 1)
				$skill4 = Skill.new()
				$skill4.label = "Challenge seeker"
				$skill4.user_id = @user.user_id
				$skill4.save
			else
				$skill4 = Skill.new()
				$skill4.label = "Focused"
				$skill4.user_id = @user.user_id
				$skill4.save
			end
			if(@survey.question5 == 1)
				$skill5 = Skill.new()
				$skill5.label = "Multilingual"
				$skill5.user_id = @user.user_id
				$skill5.save
			end
		end
		@survey.destroy
		@anssurvey = Survey.new()
	end

	def add
		@user = current_user
		@anssurvey = Survey.new(survey_params)
		@anssurvey.user_id = @user.user_id
		@anssurvey.save
		if(@anssurvey.question1 == 1)
			$skill1.destroy
		end
		if(@anssurvey.question2 == 1)
			$skill2.destroy
		end
		if(@anssurvey.question3 == 1)
			$skill3.destroy
		end
		if(@anssurvey.question4 == 1)
			$skill4.destroy
		end
		if(@anssurvey.question5 == 1)
			$skill5.destroy
		end
		redirect_to root_path
	end

	private
	    
	    def survey_params
	        params.require(:survey).permit(:question1, :question2, :question3, :question4, :question5)
	    end

end