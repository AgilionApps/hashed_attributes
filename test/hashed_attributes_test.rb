require 'helper.rb'

class HashedAttributesTest < Test::Unit::TestCase
  def setup
    setup_database
    @person = Person.new(:name=>"Sean Behan", :theme=>"Molokai", :plan => "Pro", :favorite_color=>"Orange")
  end

  def teardown
    teardown_database
  end

  def test_that_active_record_has_been_extended
    assert_equal ActiveRecord::Base.methods.include?("hashed_attributes"), true
  end

  def test_that_object_instantiation_is_normal
    assert_kind_of Person, Person.new(:name=>"sean", :theme=>"blue")
  end

  def test_hashed_attributes_is_an_empty_hash_on_object_initialization
    assert_equal Person.new.preferences, {}
  end

  def test_that_hashed_attributes_are_persisted_along_with_model
    Person.create(:theme=>"Molokai")
    assert_equal Person.last.theme, "Molokai"
  end

  def test_that_hashed_attributes_getter_and_setter_methods_are_using_the_hash
    assert_equal @person.preferences[:theme], @person.theme
  end

  def test_that_hashed_attributes_keys_match_the_preferences_hash
    assert_equal @person.hashed_attributes_keys, @person.preferences.keys
  end

  def test_hashed_attributes_arguments_list
    assert_equal @person.hashed_attributes_keys, [:theme, :plan, :favorite_color]
  end

  def test_that_all_hashed_attributes_values_have_been_set_correctly
    assert_equal @person.preferences.values, ["Molokai", "Pro", "Orange"]
  end

end
