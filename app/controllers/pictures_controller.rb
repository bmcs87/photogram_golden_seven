class PicturesController < ApplicationController
 
  #New Picture
  def new_form
    render("pic_templates/photos_new_template.html.erb")
  end
  
  #Create Row
  def create_row
      # The Parameters:  {"the_source"=>"hi", "the_caption"=>"there"}
      
      p = Photo.new
      p.source = params["the_source"]
      p.caption = params["the_caption"]
      p.save
      
      @photo_count =Photo.count
      
      render("pic_templates/create_row.html.erb")
  end
      
  def show
    # Here are the Parameters: {"an_id"=>"5"}
    #the_id_number = params["an_id"]
    
    pic = Photo.find(params["an_id"]).source
    
    @the_source = pic.source
    @the_caption = pic.caption
    render("pic_templates/show_template.html.erb")
  end

end
