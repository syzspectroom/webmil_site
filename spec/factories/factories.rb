include ActionDispatch::TestProcess

FactoryGirl.define do
 
  factory :work do
  	# object_id
    name "Example image"
    url "http://ya.ru"

    main_image File.open (Rails.root.join("spec/fixtures/files/x_7458bf26.jpg"))
  end
end