# encoding: utf-8

# läs in filer för testsviten från Rubys standardbibliotek
require "test/unit"

# läs in de filer vi vill testa, så att vi kommer åt metoderna
require "./kgm-uppgift21b.rb"

# vår testklass ärver från testsviten
class Uppgift21bTest < Test::Unit::TestCase

	# metoder med i klassen med namn som börjar med test_ körs automagiskt

	# vi vill testa vår funktion för att fylla lådor, uppgift 21b
	def test_fill_boxes

		# check:a att vi får ut 166 lådor, givet 1000 ägg, 6 ägg/låda
		expected_no_of_boxes = 166
		total_amount = 1000
		box_size = 6

		# assert_equal(expected,actual); är vad vi väntar oss == vad vi faktiskt får?
		assert_equal( expected_no_of_boxes, fill_boxes(total_amount, box_size) )
	end
end

require "./kgm-uppgift21c.rb"

class Uppgift21cTest < Test::Unit::TestCase

	def setup_boxmachine( total_amount = 1000, box_size = 6 )
		return my_machine = Boxmachine.new( total_amount, box_size )
	end

	def test_new_boxmachine

		# create machine using default inital values
		my_machine = setup_boxmachine

		# check we got something back (i.e. my_machine != nil)
		assert( my_machine )
	end

	def test_boxmachine_storage_getter

		total_amount = 1000
		my_machine = setup_boxmachine( total_amount )

		# check that we have total_amount in storage
		assert_equal( total_amount, my_machine.storage )
	end

	def test_boxmachine_box_size_getter

		box_size = 6
		my_machine = setup_boxmachine( box_size )

		# check that we have total_amount in storage
		assert_equal( box_size, my_machine.box_size )
	end

	def test_boxmachine_fill_one_box

		my_machine = setup_boxmachine( 6, 6 )
		assert_equal( 1, my_machine.fill )
	end

	def test_boxmachine_fill_unable_to_fill_any_boxes

		my_machine = setup_boxmachine( 5, 6 )
		assert_equal( 0, my_machine.fill )
	end		

	def test_boxmachine_fill_deducts_from_storage

		my_machine = setup_boxmachine( 10,6 )
		assert_equal( 1, my_machine.fill )
		assert_equal( 4, my_machine.storage )
	end
end

require "./kgm-uppgift21d.rb"

class Uppgift21dTest < Test::Unit::TestCase

	def setup_boxmachine( total_amount = 1000, box_size = 6 )
		return my_machine = Boxmachine21d.new( total_amount, box_size )
	end

	def test_new_boxmachine

		# create machine using default inital values
		my_machine = setup_boxmachine

		# check we got something back (i.e. my_machine != nil)
		assert( my_machine )
	end

	def test_boxmachine_storage_getter

		total_amount = 1000
		my_machine = setup_boxmachine( total_amount )

		# check that we have total_amount in storage
		assert_equal( total_amount, my_machine.storage )
	end

	def test_boxmachine_box_size_getter

		box_size = 6
		my_machine = setup_boxmachine( box_size )

		# check that we have total_amount in storage
		assert_equal( box_size, my_machine.box_size )
	end

	def test_boxmachine_fill_one_box

		my_machine = setup_boxmachine( 6, 6 )
		assert_equal( 1, my_machine.fill )
	end

	def test_boxmachine_fill_unable_to_fill_any_boxes

		my_machine = setup_boxmachine( 5, 6 )
		assert_equal( 0, my_machine.fill )
	end		

	def test_boxmachine_fill_deducts_from_storage

		my_machine = setup_boxmachine( 10,6 )
		assert_equal( 1, my_machine.fill )
		assert_equal( 4, my_machine.storage )
	end

	def test_boxmachine_load_increases_storage

		total_amount = 1000
		my_machine = setup_boxmachine( total_amount )
		assert_equal( total_amount, my_machine.storage )

		my_machine.load(1)
		assert_equal( 1001, my_machine.storage )

	end

	def test_boxmachine_has_no_storage_setter

		my_machine = setup_boxmachine

		assert_raise NoMethodError do
			my_machine.storage = 100 # also, don't reopen Boxmachine class from uppgift21c...
		end
	end

	def test_fill_specified_number_of_boxes
		my_machine = setup_boxmachine( 18,6 )
		assert_equal( 1, my_machine.fill( 1 ) )
		assert_equal( 12, my_machine.storage )
	end

	def test_fill_specified_number_of_boxes_with_insufficient_storage
		my_machine = setup_boxmachine( 10,6 )
		assert_equal( nil, my_machine.fill( 2 ) )
		assert_equal( 10, my_machine.storage )
	end

	def test_to_s
		my_machine = setup_boxmachine( 1,1 )
		assert_equal( "The machine has 1 units in storage and is set to a box size of 1.", my_machine.to_s )
	end
end
