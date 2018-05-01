HOMEPAGE = "https://budgeting-a937b.firebaseapp.com/budget"

def path_to(page_name)
    case page_name
    when /home page/i
       base_url = HOMEPAGE
    when /google page/i
       base_url = "https://www.google.com/"
    else
      raise "Can't find mapping from \"#{page_name}\" to a url.\n" +
        "Please add a mapping in #{__FILE__}"
    end
end
