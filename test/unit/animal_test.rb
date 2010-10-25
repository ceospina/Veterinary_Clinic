require File.dirname(__FILE__) + '/../test_helper'

class AnimalTest < ActiveSupport::TestCase
	fixtures :animals
	
	#def testAnimalClienteSinRaza
	#	desconocido = animals(:SinRazaConCliente)
	#	assert_equal(deconocido.client_id, desconocido.cliente)
	#end
	test "the truth" do
    assert true
  end
  
end
