class PicturesController < ApplicationController
 
 
  #Part 1 of Create 
  #New Picture
  def new_form
    render("pic_templates/photos_new_template.html.erb")
  end
  
  #Part 2 of Create
  #Create Row
  def create_row
      # The Parameters:  {"the_source"=>"hi", "the_caption"=>"there"}
      
      p = Photo.new
      p.source = params["the_source"]
      p.caption = params["the_caption"]
      p.save
      
      @photo_count =Photo.count
      
      render("pic_templates/create_row_template.html.erb")
  end
   
    
  #Part 1 of Read  
  #Index
  def index
    @photos = Photo.all
    
    render("pic_templates/index_template.html.erb")
  end
    
  #Part 2 of Read  
  #Show    
  def show
    # Here are the Parameters: {"an_id"=>"5"}
    #the_id_number = params["an_id"]
    
    pic = Photo.find(params["an_id"]).source
    
    @the_source = pic.source
    @the_caption = pic.caption
    render("pic_templates/show_template.html.erb")
  end

  
  #Part 1 of Update
  #Edit Form
  def edit_form
    #@director = Director.find(params[:id])
  
    render("pic_templates/edit_form_template.html.erb")  
  end
  
  #Part 2 of Update
  #Update Row
  def update_row
    
    @photos = Photo.find(params[:id])

    @photos.dob = params[":dob"]
    @photos.name = params[":name"]
    @photos.bio = params[":bio"]
    @photos.image_url = params[":image_url"]

    @photos.save
    
    render("pic_templates/update_row_template.html.erb")
  end
  
  
  #Part 1 of 1 of Delete
  #Delete
  def destroy_row
    
    @photos = Photo.find(params[:id])
    @photos.destroy
    
    render("pic_templates/destroy_row_template.html.erb")
  end

end
