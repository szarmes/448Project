module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Job Cannon"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


  def resource_name
  :user
end

def resource
  @resource ||= User.new
end

def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
end

def broadcast(channel, &block)
  message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
  uri = URI.parse("http://localhost:9292/faye")
  Net::HTTP.post_form(uri, :message => message.to_json)
end
end