class TagsController < ApplicationController
  allow_unauthenticated_access only: %i[ home ]

  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /
  def home
    @tags = Tag.includes(:activities)
               .where(activities: { drawn_on: nil })
               .order(:label)
               .select { |tag| tag.activities.any? }
  end

  # POST /tags/draw
  def draw
    tags = Tag.includes(:activities).where(id: draw_params, activities: { drawn_on: nil })

    activities = tags.map { |tag| tag.activities }.reduce(:&)

    activity = activities&.sample

    if activity&.draw!
      redirect_to drawn_activity_path(activity)
    else
      redirect_to root_path, alert: "Activity could not be drawn."
    end
  end

  # GET /tags or /tags.json
  def index
    @tags = Tag.includes(:activities).all
  end

  # GET /tags/1 or /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags or /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: "Tag was successfully created." }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: "Tag was successfully updated." }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @tag.destroy!

    respond_to do |format|
      format.html { redirect_to tags_path, status: :see_other, notice: "Tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.includes(:activities).find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.expect(tag: [ :label ])
    end

    def draw_params
      params.expect(tag_ids: [])
    end
end
