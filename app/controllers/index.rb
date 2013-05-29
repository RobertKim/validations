get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :event_create
end

post '/events/create' do

  @event_create = Event.create(organizer_name: params[:name],
    organizer_email: params[:email],
    title: params[:title],
    date: params[:date])


  if @event_create.save
    redirect "/events/#{@event_create.id}/show"
   else
  	@errors = @event_create.errors.full_messages
  	erb :event_create
  end
end