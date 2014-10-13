#encoding: UTF-8

require "roo"
require "spreadsheet"

class ScheduleParser

def self.parse_ods(path)
  #open ods file with UTF_8 encoding option
  s = Roo::OpenOffice.new(path, ods_options: {encoding: Encoding::UTF_8})

  @result = {}
  @daily_schedule = {}
  day = {}
  film = {}
  lastrow = s.last_row
  lastcolumn = s.last_column
  y = 2

  @result[:mois] = s.cell(1,3)
  @result[:cinema1] = s.cell(1,2)
  @result[:cinema2] = s.cell(1,5)

  while y != lastrow  do
    x = 1

    while x != lastcolumn+1 do

      value = s.cell(y,x)

      if s.cell(y, 3).nil?
        key = s.cell(y-1, 3).gsub(/[^\d]/, '').to_s
        flagline = true # second line of a date
      else
        key = s.cell(y, 3).gsub(/[^\d]/, '').to_s
        flagline = false #first line of a date
      end

      case x
        when 1
          if flagline
            day[:horaire2] = value
          else
            day[:horaire1] = value
          end
        when 2
          if flagline
            day[:film3] = value
            unless film.has_key?(value)
              unless value.nil?
                if value.include? ':'
                  value.sub!(':', ' ')
                end
                if value.include? "'"
                  value.sub!("'", ' ')
                end
                if value.include? ","
                  value.sub!(",", '')
                end
                value_escaped = CGI::escape(value)
                film.store(value,[value_escaped])
              end
            end
          else
            day[:film1] = value
            unless film.has_key?(value)
              unless value.nil?
                if value.include? ':'
                  value.sub!(':', ' ')
                end
                if value.include? "'"
                  value.sub!("'", ' ')
                end
                if value.include? ","
                  value.sub!(",", '')
                end
                value_escaped = CGI::escape(value)
                film.store(value,[value_escaped])
              end
            end
          end
        when 3
          unless flagline
            day[:date] = value
          end
        when 5
          if flagline
            day[:film4] = value
            unless film.has_key?(value)
              unless value.nil?
                if value.include? ':'
                  value.sub!(':', ' ')
                end
                if value.include? "'"
                  value.sub!("'", ' ')
                end
                if value.include? ","
                  value.sub!(",", '')
                end
                value_escaped = CGI::escape(value)
                film.store(value,[value_escaped])
              end
            end
          else
            day[:film2] = value
            unless film.has_key?(value)
              unless value.nil?
                if value.include? ':'
                  value.sub!(':', ' ')
                end
                if value.include? "'"
                  value.sub!("'", ' ')
                end
                if value.include? ","
                  value.sub!(",", '')
                end
                value_escaped = CGI::escape(value)
                film.store(value,[value_escaped])
              end
            end
          end
        else
          # case ignored
      end
      x += 1
    end
    @daily_schedule[key] = day
    if flagline
      day = {}
    end
    y +=1
  end
  @result[:daily_schedule] = @daily_schedule
  @result[:result] = film
  @result
end

 def self.parse_ods_with_day(path, date)
   s = Roo::OpenOffice.new(path, ods_options: {encoding: Encoding::UTF_8})

   @result = {}
   @daily_schedule = {}
   day = {}
   film = {}
   lastrow = s.last_row
   lastcolumn = s.last_column
   y = 2 # Start on line 2 to avoid header

   @result[:mois] = s.cell(1,3)
   @result[:cinema1] = s.cell(1,2)
   @result[:cinema2] = s.cell(1,5)

   while y != lastrow  do
     x = 1

     while x != lastcolumn+1 do

       value = s.cell(y,x)

       if s.cell(y, 3).nil?
         key = s.cell(y-1, 3).gsub(/[^\d]/, '').to_s
         flagline = true # second line of a date
       else
         key = s.cell(y, 3).gsub(/[^\d]/, '').to_s
         flagline = false #first line of a date
       end

       case key
         when date
           case x
             when 1
               if flagline
                 day[:horaire2] = value
               else
                 day[:horaire1] = value
               end
             when 2
               if flagline == false
                 day[:film1] = value
                 unless film.has_key?(value)
                   unless value.nil?
                     if value.include? ':'
                       value.sub!(':', ' ')
                     end
                     if value.include? "'"
                       value.sub!("'", ' ')
                     end
                     if value.include? ","
                       value.sub!(",", '')
                     end
                     value_escaped = CGI::escape(value)
                     film.store(value,[value_escaped])
                   end
                 end
               elsif flagline == true
                 day[:film3] = value
                 unless film.has_key?(value)
                   unless value.nil?
                     if value.include? ':'
                       value.sub!(':', ' ')
                     end
                     if value.include? "'"
                       value.sub!("'", ' ')
                     end
                     if value.include? ","
                       value.sub!(",", '')
                     end
                     value_escaped = CGI::escape(value)
                     film.store(value,[value_escaped])
                   end
                 end
               end
             when 3
               unless flagline == true
                 day[:date] = value
               end
             when 5
               if flagline == false
                 day[:film2] = value
                 unless film.has_key?(value)
                   unless value.nil?
                     if value.include? ':'
                       value.sub!(':', ' ')
                     end
                     if value.include? "'"
                       value.sub!("'", ' ')
                     end
                     if value.include? ","
                       value.sub!(",", '')
                     end
                     value_escaped = CGI::escape(value)
                     film.store(value,[value_escaped])
                   end
                 end
               elsif flagline == true
                 day[:film4] = value
                 unless film.has_key?(value)
                   unless value.nil?
                     if value.include? ':'
                       value.sub!(':', ' ')
                     end
                     if value.include? "'"
                       value.sub!("'", ' ')
                     end
                     if value.include? ","
                       value.sub!(",", '')
                     end
                     value_escaped = CGI::escape(value)
                     film.store(value,[value_escaped])
                   end
                 end
               end
             else
               # cellule non traitée
           end
         else
           # date non traitée
       end
       x += 1
     end
     unless day[:date].nil?
       @daily_schedule.store( key, day)
     end
     if flagline
       day = {}
     end
     y +=1
   end
   @result.store( :daily_schedule, @daily_schedule)
   @result.store( :result, film)
   @result
 end

end
