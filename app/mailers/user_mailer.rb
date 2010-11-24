class UserMailer < ActionMailer::Base
  default :from => "ceospina@gmail.com",:to => User.all.map(&:email).join(", ")
            
   def promocion(contenido)  
          #@contenido=contenido
          #encoded_content = File.read("#{Rails.root}/public/images/img01.jpg")
          #attachments["rails.png"] = {:mime_type=>'image/png', :content=> File.read("#{Rails.root}/public/images/rails.png")  }
          #attachments["img01.jpg"] = {:mime_type=>'image/jpeg',:content => encoded_content }
          
          #attachments['Viejasordo.mp3'] = {
          #  :mime_type => 'audio/mpeg',
          #  :content => File.read(Rails.root + 'public/Viejasorda.mp3')
          #}
          # attachments.inline['img01.jpg'] = {:mime_type=>'image/jpeg', :content=> File.read("#{Rails.root}/public/images/img01.jpg")}
          mail( :subject => "Registered") do |format|
           format.html {render :text => contenido}
          end             
        
   end  
   
end
