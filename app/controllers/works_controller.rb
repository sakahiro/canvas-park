# frozen_string_literal: true
class WorksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]
  before_action :set_work, only: [:edit, :update, :destroy]

  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
    redirect_to works_url, notice: 'Work was not found' if @work.nil?
  end

  def new
    @work = Work.new
  end

  def edit
  end

  def create
    @work = current_user.works.new(work_params)

    if @work.save
      redirect_to @work, notice: 'Work was successfully created.'
    else
      render :new
    end
  end

  def update
    if @work.update(work_params)
      redirect_to @work, notice: 'Work was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to works_url, notice: 'Work was successfully destroyed.'
  end

  private

  def set_work
    @work = current_user.works.find(params[:id])
    redirect_to works_url, notice: 'Work was not found' if @work.nil?
  end

  def work_params
    params.require(:work).permit(:title, :description, :work_image)
  end
end
