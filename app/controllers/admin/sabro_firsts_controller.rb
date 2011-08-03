class Admin::SabroFirstsController < Admin::BasesController
  before_filter :admin_authorize
  # GET /sabro_firsts
  # GET /sabro_firsts.xml
  def index

    @title = t("h2.sabro_firsts")
    @search = SabroFirst.search(params[:search])

    p  @search
    unless params[:keyword].blank?
      p 222222222222222222222
      name = split_keyword(params[:keyword])
      
      @search.email_or_name_like = params[:keyword]
      #      @search.or_content_like = name
      #      @search.or_email_like = name
    end

#      Article.where((:name =~ 'Hello%') | (:content =~ 'Goodbye%')).to_sql


    @sabro_firsts = @search.paginate(:page => params[:page])

    #    @sabro_firsts = SabroFirst.where(:name => '123').paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 1)
    #    @sabro_firsts = SabroFirst.find(:all ,:conditions => ["name like ? " ,'%12%']).paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 1)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sabro_firsts }
    end
  end

  # GET /sabro_firsts/1
  # GET /sabro_firsts/1.xml
  def show
    @title = t("h2.sabro_firsts")
    @sabro_first = SabroFirst.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sabro_first }
    end
  end

  # GET /sabro_firsts/new
  # GET /sabro_firsts/new.xml
  def new
    @title = t("h2.sabro_firsts")
    @sabro_first = SabroFirst.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sabro_first }
    end
  end

  # GET /sabro_firsts/1/edit
  def edit
    @title = t("h2.sabro_firsts")
    @sabro_first = SabroFirst.find(params[:id])
  end

  # POST /sabro_firsts
  # POST /sabro_firsts.xml
  def create
    @sabro_first = SabroFirst.new(params[:sabro_first])

    respond_to do |format|
      if @sabro_first.save
        flash[:notice] = 'SabroFirst was successfully created.'
        format.html { redirect_to(admin_sabro_firsts_path) }
        format.xml  { render :xml => @sabro_first, :status => :created, :location => @sabro_first }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sabro_first.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sabro_firsts/1
  # PUT /sabro_firsts/1.xml
  def update
    @sabro_first = SabroFirst.find(params[:id])

    respond_to do |format|
      if @sabro_first.update_attributes(params[:sabro_first])
        flash[:notice] = 'SabroFirst was successfully updated.'
        format.html { redirect_to(admin_sabro_firsts_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sabro_first.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sabro_firsts/1
  # DELETE /sabro_firsts/1.xml
  def destroy
    @sabro_first = SabroFirst.find(params[:id])
    @sabro_first.destroy

    respond_to do |format|
      format.html { redirect_to(admin_sabro_firsts_path) }
      format.xml  { head :ok }
    end
  end
end
