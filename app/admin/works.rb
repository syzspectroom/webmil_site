ActiveAdmin.register Work do
  form :partial => "works_form"

  index do
 		column :name
 		column :short_description
 		column 'Added', :created_at
 		
 		default_actions
  end
  
end
