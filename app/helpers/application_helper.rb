module ApplicationHelper
def formated_date(the_date)  
   return the_date.strftime('%d.%m.%Y') unless the_date == nil
end
end
