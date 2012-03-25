ActiveAdmin.register Work do
  # form :partial => "works_form"

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs do
      f.input :name
      f.input :url
      f.input :main_image, as: :file, hint: f.object.main_image.nil? ? f.template.content_tag(:span, "no map yet") : f.template.image_tag(f.object.main_image.url())

      f.input :main_image_cache, as: :hidden
      f.input :short_description
      f.input :description
      f.input :show_on_mine_page
    end

    f.has_many :pictures do |p|
      p.inputs do
        p.input :_destroy, :as => :boolean, :label => "Destroy?" if !p.object.nil?
        p.input :title
        p.input :image, as: :file, hint: p.object.image.nil? ? p.template.content_tag(:span, "no map yet") : p.template.image_tag(p.object.image.url(:thumb))
      end
 	end 
  	f.buttons
 end

  index do
 	  column :name
 	  column :short_description 
 	  column 'Added', :created_at
 	  
 	  default_actions
  end
  
end
