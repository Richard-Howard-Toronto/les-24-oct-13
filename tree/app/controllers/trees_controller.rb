class TreesController < ApplicationController



  def index
    @tree_array = ['pine','birch','poplar']
    render :cover_page

  end





end
