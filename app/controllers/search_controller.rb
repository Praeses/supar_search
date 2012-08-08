class SearchController < ApplicationController

  SEARCHABLE =[ Company, Address, Inspection ]

  def blank
  end

  def index
    render json: SEARCHABLE.map {|klass| klass.search(params[:q]) }.flatten
  end
end
