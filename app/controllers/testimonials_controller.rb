class TestimonialsController < ApplicationController
  load_and_authorize_resource except: [:index]

  def index
    @testimonials = Testimonial.paginate(page: params[:page] ||= 1, per_page: 15)
  end

  def admin_index
    @testimonials = Testimonial.paginate(page: params[:page] ||= 1)
  end

  def new
    @testimonial = Testimonial.new
  end

  def edit
    @testimonial = Testimonial.find(params[:id])
  end

  def create
    @testimonial = Testimonial.new(params[:testimonial])

    if @testimonial.save
      redirect_to '/admin/testimonials', notice: 'Testimonial successfully added.'
    else
      render :new
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])

    if @testimonial.update_attributes(params[:testimonial])
      redirect_to '/admin/testimonials', notice: 'Testimonial successfully updated.'
    else
      render :edit
    end
  end
end