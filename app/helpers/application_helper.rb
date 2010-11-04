module ApplicationHelper
  def Doctors_for_select form
    form.select :doctor_id, Doctor.for_select
  end
  def Clients_for_select form
    form.select :client_id, Client.for_select
  end 
    
end
