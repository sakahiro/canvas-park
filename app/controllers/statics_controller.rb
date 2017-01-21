# frozen_string_literal: true
class StaticsController < ApplicationController
  def top
    @works = Work.limit(3)
    render layout: false
  end

  def about; end
end
