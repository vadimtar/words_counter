class CounterController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    plain = ''
    begin
      string = params[:string].to_s
      add_words(string)
      plain = "OK"
    rescue Exception => ex
      plain = ex.to_s
    end

    render plain: plain
  end

  def create_from_file
    plain = ''
    begin
      file = (params[:file].is_a? ActionDispatch::Http::UploadedFile) ? (params[:file].read).to_s : ''
      add_words(file)
      plain = "OK"
    rescue Exception => ex
      plain = ex.to_s
    end

    render plain: plain
  end

  private

  def add_words(words)
    counter_service = CounterService.new
    counter_service.process_string(words)
  end
end
