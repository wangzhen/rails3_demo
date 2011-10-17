class Admin::CategoriesController < Admin::BasesController
  before_filter :admin_authorize
  # GET /categories
  # GET /categories.xml
  def index

    @title = t("h2.categories")
    @search = Category.search(params[:search])

    p  @search
    unless params[:keyword].blank?
      p 222222222222222222222
      name = split_keyword(params[:keyword])
      
      @search.name_like = params[:keyword]
      #      @search.or_content_like = name
      #      @search.or_email_like = name
    end

#      Article.where((:name =~ 'Hello%') | (:content =~ 'Goodbye%')).to_sql


    @categories = @search.paginate(:page => params[:page])

    #    @categories = Category.where(:name => '123').paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 1)
    #    @categories = Category.find(:all ,:conditions => ["name like ? " ,'%12%']).paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 1)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @title = t("h2.categories")
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @title = t("h2.categories")
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @title = t("h2.categories")
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to(admin_categories_path) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to(admin_categories_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_categories_path) }
      format.xml  { head :ok }
    end
  end
end
