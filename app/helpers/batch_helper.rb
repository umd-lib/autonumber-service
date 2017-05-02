module BatchHelper
  def display_range(first_id, last_id)
    first = AutoNumber.find(first_id)
    last = AutoNumber.find(last_id)
    first.file_name + (first != last ? ' to ' + last.file_name : '')
  end
end
