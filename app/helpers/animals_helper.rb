module AnimalsHelper
  
  #def Breeds_for_select form
  # form.select :breed_id, Breed.for_select
  #end
  
  def Breeds_for_select (form)
    form.select :breed_id, 
    Breed.for_select
  end
  
  
end
