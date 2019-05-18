json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :user_id, :car_id
  json.start event.start_date   
  json.end event.end_date   
  json.url event_url(event, format: :html) 
end


# [
#   {
#     "id":1,
#     "title":"予約テスト",
#     "description":"備考テスト",
#     "user_id":1,
#     "car_id":1,
#     "start":"2019-05-15T12:36:00.000Z",
#     "end":"2019-05-15T12:36:00.000Z",
#     "url":"http://localhost:3000/events/1.html"
#   },
  
#   {
#     "id":2,
#     "title":"予約テスト2",
#     "description":"備考テスト２",
#     "user_id":1,
#     "car_id":2,
#     "start":"2019-05-16T06:44:00.000Z",
#     "end":"2019-05-16T23:44:00.000Z",
#     "url":"http://localhost:3000/events/2.html"
#   }
# ]