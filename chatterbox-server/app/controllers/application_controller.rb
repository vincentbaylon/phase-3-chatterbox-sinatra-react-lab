class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    Message.all.to_json
  end
  
  post '/messages' do
    Message.create(params).to_json
  end

  patch '/messages/:id' do
    update_message = Message.find(params[:id])
    update_message.update(params)
    update_message.to_json
  end

  delete '/messages/:id' do
    delete_message = Message.find(params[:id])
    delete_message.destroy
    delete_message.to_json
  end

end
