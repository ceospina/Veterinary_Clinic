module ConsultasHelper
	def Doctors_for_select form
		form.select :doctor_id, Doctor.for_select
	end
	def Animals_for_select form
		form.select :animal_id, Animal.for_select
	end
	def Types_for_select form
		form.select :typeConsult_id, TypeConsult.for_select
	end
end
