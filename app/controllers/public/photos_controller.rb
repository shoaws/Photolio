class Public::PhotosController < ApplicationController
  before_action :authenticate_member!
  before_action :correct_photo, only: [:edit, :update, :destroy]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.member_id = current_member.id
    if @photo.save
      #画像を認識してタグを作成
      @tag_list = Vision.get_image_data(@photo.image)
      @photo.save_tag(@tag_list)

      @cameras = params[:photo][:camera_name].split(',')
      @photo.save_camera(@cameras)

      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def index
    member = Member.where(is_deleted: false)
    photos = Photo.where(member_id: member.ids).includes(:favorited_members).sort {|a,b| b.favorited_members.size <=> a.favorited_members.size}
    @photos = Kaminari.paginate_array(photos).page(params[:page]).per(12)
    @tags = Tag.all
  end

  def show
    @photo = Photo.find(params[:id])
    @member = @photo.member
    if @member.is_deleted == true
      flash[:alret] = "この投稿のメンバーは退会しています"
      redirect_to member_path(current_member)
    end
    @comment =PhotoComment.new
    @comments = @photo.photo_comments.all.order(created_at: :desc)
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @cameras = params[:photo][:camera_name].split(',')
    if @photo.update(photo_params)
      #画像を認識してタグを作成
      @tag_list = Vision.get_image_data(@photo.image)
      # このpost_idに紐づいていたタグを@oldに入れる
      @old_tags = PhotoTag.where(photo_id: @photo.id)
      # それらを取り出し、消す
      @old_tags.each do |tag|
      tag.delete
      end
      @photo.save_tag(@tag_list)

      # このphotoに紐づいていた機材を@old_camerasに代入
      @old_cameras = PhotoCamera.where(photo_id: @photo.id)
      # それらを取り出し、消す
      @old_cameras.each do |old_camera|
        old_camera.delete
      end
      @photo.save_camera(@cameras)

      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to member_path(current_member)
  end

  def search
    @search_photos = Photo.search(params[:keyword])
    @photos = @search_photos.page(params[:page]).per(12)
    @keyword = params[:keyword]
    render :index
  end

  def search_tag
    @tags = Tag.all
    @tag = Tag.find(params[:tag_id])
    @keyword = @tag.name
    @search_photos = @tag.photos
    @photos = @search_photos.page(params[:page]).per(12)
    render :index
  end

  def search_camera
    @cameras = Camera.all
    @camera = Camera.find(params[:camera_id])
    @keyword = @camera.name
    @search_photos = @camera.photos
    @photos = @search_photos.page(params[:page]).per(12)
    render :index
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :body, :address, :latitude, :longitude, :member_id)
  end

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

  def correct_photo
    photo = Photo.find(params[:id])
    unless photo.member.id == current_member.id
      redirect_to member_path(current_member)
    end
  end

end
