class CreateMeetings
   def createMeetings (horary)
    hora=horary.startTime    
    while hora<=horary.finalHour do
      c=meeting.new(:meetingDate=>horary.day,:meetingHour=>hora,:doctor_id=>horary.doctor_id)
      c.save
      hora=hora.advance(:minutes=>20)
    end
  end
end