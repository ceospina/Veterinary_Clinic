module BreedsHelper
  def Species_for_select (form)
    form.select :specie_id, 
    Species.for_select
  end
end
