module BreedsHelper
  def Species_for_select (form)
    form.select :specie_id, 
    Specie.for_select
  end
end
