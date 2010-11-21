module ApplicationHelper
  def Doctors_for_select form
    form.select :doctor_id, Doctor.for_select
  end
  def Clients_for_select form
    form.select :client_id, Client.for_select
  end 
  
  def use_tinymce
    @content_for_tinymce = "" 
    content_for :tinymce do
      javascript_include_tag "tiny_mce/tiny_mce"
    end
    @content_for_tinymce_init = "" 
    content_for :tinymce_init do
      javascript_include_tag "mce_editor"
    end
  end
    
end
