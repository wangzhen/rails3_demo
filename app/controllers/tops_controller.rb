class TopsController < ApplicationController
  # GET /blogs
  # GET /blogs.xml
  def index
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit

  end

  # POST /blogs
  # POST /blogs.xml
  def create


    render :update do |page|
        page.alert('sss')
      if @blog.save
        page.alert('sss')
      else
        page.alert(@blog.errors.full_messages.join("\n"))
      end
    end

    #    respond_to do |format|
    #      if @blog.save
    #        format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
    #        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
    #      else
    #        format.html { render :action => "new" }
    #        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
    #      end
    #    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update


    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy


    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end
end
