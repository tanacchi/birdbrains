class LineController < ApplicationController
  def index
    res = {body: 'Hello'};
    render json: res
  end
end
