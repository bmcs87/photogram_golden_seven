class PicturesController < ApplicationController
  def new_form
    render("pic_templates/new_form.html.erb")
  end

  def create_row
    # The Parameters: {"the_source"=>"hi", "the_caption"=>"there"}
    
    p = Photo.new
    p.source = params["the_source"]
    p.caption = params["the_caption"]
    p.save
    
    @photo_count = Photo.count
    render("pic_templates/create_row.html.erb")
  end

  def index
    @list_of_photos = Photo.all
    render("pic_templates/index.html.erb")
  end

  def show
    @the_id_number = params["the_id"]
    @pic = Photo.find(params["the_id"])
    render("pic_templates/show.html.erb")
  end

  def edit_form
    @photo_id = params["the_id"]
    @p = Photo.find(params["the_id"])
    @source = p.source
    @caption = p.caption
    render("pic_templates/edit_form.html.erb")
  end

  def update_row
    render("pic_templates/update_row.html.erb")
  end

  def destroy_row
    @photos = Photo.find(params["the_id"])
    @photos.destroy
    render("pic_templates/destroy_row.html.erb")
  end
end
