# frozen_string_literal: true
class StaticsController < ApplicationController
  def top
    @works = Work.limit(3)
  end

  def about; end
end
